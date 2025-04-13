import 'package:data/src/exception/base_api_exception.dart';
import 'package:dio/dio.dart' as dio;

class BaseApiResponse {
  BaseApiResponse({
    this.data,
    this.apiException,
    this.rawResponse,
  });

  final dynamic data;
  final BaseApiException? apiException;
  final dio.Response? rawResponse;

  bool get hasData => data != null;

  bool get hasException => apiException != null;

  BaseApiResponse copyWith({
    Map<String, dynamic>? data,
    Map<String, dynamic>? exceptionData,
    BaseApiException? apiException,
    dio.Response? rawResponse,
  }) {
    return BaseApiResponse(
      data: data ?? this.data,
      apiException: apiException ?? this.apiException,
      rawResponse: rawResponse ?? this.rawResponse,
    );
  }

  @override
  String toString() {
    return 'BaseRpcResponse{data: $data, rpcException: $apiException, rawHttpResponse: $rawResponse}';
  }
}
