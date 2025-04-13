import 'dart:async';

import 'package:data/data.dart';
import 'package:data/src/remote/api/base/request_type.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/io.dart' as dio;
import 'package:dio_intercept_to_curl/dio_intercept_to_curl.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

const _kResponseCacheLifetimeDuration = Duration(seconds: 1);

const List<Duration> _kDelaysDuration = [
  Duration(milliseconds: 400),
  Duration(milliseconds: 800),
];

const _retryStatuses = <int>{
  dio.status408RequestTimeout,
  dio.status429TooManyRequests,
  dio.status440LoginTimeout,
  dio.status460ClientClosedRequest,
  dio.status499ClientClosedRequest,
  dio.status500InternalServerError,
  dio.status502BadGateway,
  dio.status503ServiceUnavailable,
  dio.status504GatewayTimeout,
  dio.status598NetworkReadTimeoutError,
  dio.status599NetworkConnectTimeoutError,
  dio.status520WebServerReturnedUnknownError,
  dio.status521WebServerIsDown,
  dio.status522ConnectionTimedOut,
  dio.status523OriginIsUnreachable,
  dio.status524TimeoutOccurred,
  dio.status525SSLHandshakeFailed,
  dio.status527RailgunError,
};

@lazySingleton
class ApiHttpClient extends dio.DioForNative {
  static final Map<int, Future<dio.Response>> _responseCache = {};

  bool _isTestEnvironment = false;

  ApiHttpClient() {
    _isTestEnvironment =
        getIt<Set<String>>(instanceName: kEnvironmentsName).first ==
            Environment.test;
  }

  @override
  dio.Interceptors get interceptors =>
      dio.Interceptors()..addAll(_interceptors);

  late final List<dio.Interceptor> _interceptors = [
    if (kDebugMode) ...[
      DioInterceptToCurl(printOnSuccess: true),
    ],
    dio.RetryInterceptor(
      dio: this,
      logPrint: print,
      retries: _kDelaysDuration.length,
      retryDelays: _kDelaysDuration,
      retryEvaluator: _onRetry,
    ),
  ];

  Future<dio.Response> executeRequest({
    required RequestType type,
    required Uri url,
    Map<String, dynamic>? headers,
    Object? body,
  }) async {
    final int requestHashCode = url.hashCode ^ body.hashCode;
    final existResponseFuture = _responseCache[requestHashCode];
    if (!_isTestEnvironment && existResponseFuture != null) {
      return existResponseFuture;
    }

    final options = dio.Options(
      headers: headers,
      responseType: dio.ResponseType.plain,
    );

    final Future<dio.Response> httpResponseFuture;
    switch (type) {
      case RequestType.get:
        httpResponseFuture = getUri(url, options: options);
        break;
      case RequestType.post:
        httpResponseFuture = postUri(url, data: body, options: options);
        break;
      case RequestType.put:
        httpResponseFuture = putUri(url, data: body, options: options);
        break;
      case RequestType.patch:
        httpResponseFuture = patchUri(url, data: body, options: options);
        break;
      case RequestType.delete:
        httpResponseFuture = deleteUri(url, data: body, options: options);
        break;
    }

    _responseCache[requestHashCode] = httpResponseFuture;

    // should be miss for tests
    if (!_isTestEnvironment) {
      httpResponseFuture
          .then((value) async =>
              await Future.delayed(_kResponseCacheLifetimeDuration))
          .whenComplete(() => _responseCache.remove(requestHashCode));
    }

    return httpResponseFuture;
  }

  Future<bool> _onRetry(dio.DioException error, int attempt) async {
    late bool shouldRetry;

    switch (error.type) {
      case dio.DioExceptionType.cancel:
      case dio.DioExceptionType.badCertificate:
        shouldRetry = false;
        break;

      case dio.DioExceptionType.unknown:
      case dio.DioExceptionType.connectionTimeout:
      case dio.DioExceptionType.sendTimeout:
      case dio.DioExceptionType.receiveTimeout:
      case dio.DioExceptionType.connectionError:
        shouldRetry = true;
        break;

      case dio.DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        if (statusCode != null) {
          shouldRetry = _retryStatuses.contains(statusCode);
        } else {
          shouldRetry = false;
        }
        break;
    }

    if (shouldRetry) {
      return true;
    } else {
      return false;
    }
  }
}
