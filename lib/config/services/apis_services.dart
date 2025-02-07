import 'package:dio/dio.dart';
import '../../core/constants/error_messages.dart';


class ApiProvider {
  final Dio _dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 8),
      receiveTimeout: const Duration(seconds: 8),
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      }));

  Dio get dio => _dio;
  ApiProvider() {
    _dio.interceptors.add(
        InterceptorsWrapper(onRequest: (RequestOptions options, handler) async {

          return handler.next(options);
        }, onResponse: (response, handler) {
          return handler.next(response); // continue
        }, onError: (DioException err, ErrorInterceptorHandler handler) {
          switch (err.type) {
            case DioExceptionType.receiveTimeout:
            case DioExceptionType.connectionTimeout:
            case DioExceptionType.sendTimeout:
            case DioExceptionType.badCertificate:
            case DioExceptionType.connectionError:
              throw DeadlineExceededException(err.requestOptions);
            case DioExceptionType.badResponse:
              switch (err.response?.statusCode) {
                case 400:
                  throw BadRequestException(err.requestOptions);
                case 401:
                  throw UnauthorizedException(err.requestOptions);
                case 404:
                  throw NotFoundException(err.requestOptions);
                case 409:
                  throw ConflictException(err.requestOptions);
                case 500:
                  throw InternalServerErrorException(err.requestOptions);
              }
              break;
            case DioExceptionType.cancel:
              break;
            case DioExceptionType.unknown:
              throw InternalServerErrorException(err.requestOptions);
          }

          return handler.next(err);
        }));
  }
}



class BadRequestException extends DioException {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return ApiErrorMessages.invalidRequest;
  }
}

class InternalServerErrorException extends DioException {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return ApiErrorMessages.unknownError;
  }
}

class ConflictException extends DioException {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return ApiErrorMessages.conflictOccurred;
  }
}

class UnauthorizedException extends DioException {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return ApiErrorMessages.accessDenied;
  }
}

class NotFoundException extends DioException {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return ApiErrorMessages.notFoundException;
  }
}

class NoInternetConnectionException extends DioException {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return ApiErrorMessages.noInternetConnectionException;
  }
}

class DeadlineExceededException extends DioException {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return ApiErrorMessages.deadlineExceededException;
  }
}
