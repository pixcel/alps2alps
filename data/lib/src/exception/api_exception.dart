import 'package:data/src/exception/base_domain_exception_helper.dart';
import 'package:domain/domain.dart' as domain;

enum ApiException with BaseDomainExceptionHelper<domain.RepositoryException> {
  /// Undetected error
  unknown(value: 0),

  /// Something went wrong with connection
  socket(value: 92),

  /// Timeout error
  timeout(value: 93),

  /// Bad Request -- Something went wrong
  badRequest(value: 400),

  /// Unauthorized -- Your API key is wrong
  unauthorized(value: 401),

  /// Forbidden -- You do not have permission to access this resource
  forbidden(value: 403),

  /// Not Found -- The specified resource could not be found
  notFound(value: 404),

  /// Method Not Allowed -- You tried to access a resource with an invalid method
  methodNotAllowed(value: 405),

  /// Not Acceptable -- You requested a format that isn't json
  notAcceptable(value: 406),

  /// Unprocessable Entity -- Your input failed validation.
  unprocessableEntity(value: 422),

  /// Too Many Requests -- You're making too many API requests.
  tooManyRequests(value: 429),

  /// Internal Server Error -- We had a problem with our server. Try again later.
  internalServerError(value: 500),

  /// Service Unavailable -- We're temporarily offline for maintenance. Please try again later.
  serviceUnavailable(value: 503);

  const ApiException({required this.value});

  @override
  final int value;

  @override
  String toString() {
    return '$runtimeType : $name : $value';
  }

  @override
  domain.RepositoryException get map {
    switch (this) {
      case ApiException.unknown:
        return domain.RepositoryException.unknown;
      case ApiException.badRequest:
      case ApiException.methodNotAllowed:
      case ApiException.notFound:
        return domain.RepositoryException.internal;
      case ApiException.timeout:
      case ApiException.socket:
      case ApiException.serviceUnavailable:
      case ApiException.forbidden:
      case ApiException.unauthorized:
      case ApiException.notAcceptable:
      case ApiException.unprocessableEntity:
      case ApiException.tooManyRequests:
      case ApiException.internalServerError:
        return domain.RepositoryException.connection;
    }
  }
}
