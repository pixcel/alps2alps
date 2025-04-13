import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:data/src/di/configure_dependencies.dart';
import 'package:data/src/di/global_aliases.dart';
import 'package:data/src/exception/api_exception.dart';
import 'package:data/src/exception/base_api_exception.dart';
import 'package:data/src/remote/api/base/api_http_client.dart';
import 'package:data/src/remote/api/base/base_api_response.dart';
import 'package:data/src/remote/api/base/header_helper.dart';
import 'package:data/src/remote/api/base/request_type.dart';
import 'package:dio/dio.dart' as dio;

abstract class BaseApiRepository {
  final _appHttpClient = getIt<ApiHttpClient>();
  final _headerHelper = getIt<HeaderHelper>();

  String get baseApiUrl => configRepository.baseApiUrl;

  Future<BaseApiResponse> executeRequest({
    required String path,
    required RequestType requestType,
    Map<String, dynamic>? body,
    bool overrideBaseUrl = false,
  }) async {
    return _processRequestException(
      processingFunction: () async {
        final url = overrideBaseUrl ? path : '$baseApiUrl/$path';
        final httpResponse = await _execute(
          uri: Uri.parse(url),
          requestType: requestType,
          requestBody: body,
        );
        return await _toSuccessApiResponse(httpResponse: httpResponse);
      },
    );
  }

  Future<BaseApiResponse> _processRequestException({
    required Function processingFunction,
  }) async {
    late BaseApiResponse baseApiResponse;

    try {
      baseApiResponse = await processingFunction();
    } on dio.DioException catch (e) {
      baseApiResponse = await _toErrorApiResponse(exception: e);
    } on SocketException catch (e) {
      baseApiResponse = BaseApiResponse(
        apiException: BaseApiException(
            exception: ApiException.socket,
            rawException: e,
            stackTrace: StackTrace.current),
      );
    } on TimeoutException catch (e) {
      baseApiResponse = BaseApiResponse(
        apiException: BaseApiException(
            exception: ApiException.timeout,
            rawException: e,
            stackTrace: StackTrace.current),
      );
    } catch (e) {
      baseApiResponse = BaseApiResponse(
        apiException: BaseApiException(
            exception: ApiException.unknown,
            rawException: e,
            stackTrace: StackTrace.current),
      );
    } finally {
      if (baseApiResponse.hasException) {
        logRepository.error(
          error: baseApiResponse.apiException!.toString(),
          stackTrace: baseApiResponse.apiException!.stackTrace,
          target: this,
        );
        throw baseApiResponse.apiException!.exception;
      }
    }

    return baseApiResponse;
  }

  Future<dynamic> _encodeBody({
    required Map<String, dynamic>? body,
  }) async {
    final Map<String, dynamic> result = {};

    if (body != null) {
      result.addAll(body);
    }

    return dio.FormData.fromMap(result);
  }

  Future<dio.Response> _execute({
    required Uri uri,
    required RequestType requestType,
    required Map<String, dynamic>? requestBody,
  }) async {
    final headers = await _headerHelper.generateHeaders();
    final body = await _encodeBody(body: requestBody);
    return _appHttpClient.executeRequest(
      type: requestType,
      url: uri,
      headers: headers,
      body: body,
    );
  }

  Future<BaseApiResponse> _toSuccessApiResponse({
    required dio.Response httpResponse,
  }) async {
    BaseApiResponse baseResponse;

    final body = httpResponse.data;
    if (body?.isNotEmpty == true) {
      baseResponse = processSuccessData(httpResponse, jsonDecode(body));
    } else {
      baseResponse = BaseApiResponse(data: true, rawResponse: httpResponse);
    }

    return Future.value(baseResponse.copyWith(rawResponse: httpResponse));
  }

  Future<BaseApiResponse> _toErrorApiResponse({
    required dio.DioException exception,
  }) async {
    final httpResponse = exception.response;
    if (httpResponse != null) {
      final baseResponse = BaseApiResponse(
        rawResponse: httpResponse,
        apiException: BaseApiException(
          exception: processExceptionData(httpResponse),
          rawException: httpResponse,
          stackTrace: StackTrace.current,
        ),
      );

      return Future.value(baseResponse.copyWith(rawResponse: httpResponse));
    } else {
      if (exception.type == dio.DioExceptionType.connectionError) {
        return Future.value(
          BaseApiResponse(
            apiException: BaseApiException(
              exception: ApiException.socket,
              rawException: exception,
              stackTrace: StackTrace.current,
            ),
          ),
        );
      }
      return Future.value(
        BaseApiResponse(
          apiException: BaseApiException(
            exception: ApiException.unknown,
            rawException: exception,
            stackTrace: StackTrace.current,
          ),
        ),
      );
    }
  }

  /// Processes success API response
  BaseApiResponse processSuccessData(dio.Response httpResponse, dynamic json) {
    return BaseApiResponse(data: json, rawResponse: httpResponse);
  }

  /// Processes API response with error
  Exception processExceptionData(dio.Response httpResponse) {
    return ApiException.values.firstWhere(
      (exception) => exception.isEqual(httpResponse.statusCode),
      orElse: () => ApiException.unknown,
    );
  }
}
