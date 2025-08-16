import 'package:dio/dio.dart';

import 'exceptions.dart';
import 'failures.dart';

class ErrorHandler {
  ErrorHandler._();

  /// Converts any error into a Failure to be handled at the Repo/UseCase/UI level
  static Failure handleFailureError(dynamic error) {
    if (error is ServerException) {
      return ServerFailure(errorMessage: error.exceptionMessage);
    } else if (error is CacheException) {
      return CacheFailure(errorMessage: error.exceptionMessage);
    } else if (error is DioException) {
      String errorMessage = "Unexpected error occurred";

      try {
        if (error.response != null &&
            error.response?.data is Map<String, dynamic>) {
          final data = error.response?.data;
          final message = data['message'];
          if (message != null && message is String) {
            errorMessage = message;
          }
        }
      } catch (_) {
        // fallback silently to generic errorMessage
      }

      return ServerFailure(errorMessage: errorMessage);
    } else {
      return const GeneralFailure();
    }
  }

  /// Converts Dio or other exceptions into internal domain exceptions
  static GenericExceptions handleExceptionError(dynamic error) {
    if (error is DioException) {
      if (error.response != null) {
        try {
          final data = error.response?.data;
          final message = data['message']?.toString() ?? "backend error";
          return ServerException(exceptionMessage: message);
        } catch (_) {
          return const ServerException(exceptionMessage: "backend error");
        }
      } else {
        return const GeneralException();
      }
    } else if (error is ServerException) {
      return ServerException(exceptionMessage: error.exceptionMessage);
    } else if (error is CacheException) {
      return CacheException(exceptionMessage: error.exceptionMessage);
    } else {
      return const GeneralException();
    }
  }
}
