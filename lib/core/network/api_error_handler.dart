import 'package:dio/dio.dart';

class ApiErrorHandler {
  static String handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return "Connection timeout. Please check your internet connection.";
        case DioExceptionType.sendTimeout:
          return "Send timeout in connection with server.";
        case DioExceptionType.receiveTimeout:
          return "Receive timeout in connection with server.";
        case DioExceptionType.badResponse:
          return _handleResponseError(error.response);
        case DioExceptionType.cancel:
          return "Request to server was cancelled.";
        case DioExceptionType.connectionError:
          return "No internet connection. Please try again.";
        default:
          return "Unexpected error occurred. Please try again.";
      }
    } else {
      return error?.toString() ?? "An unexpected error occurred.";
    }
  }

  static String _handleResponseError(Response? response) {
    if (response == null) return "Server response error";
    final statusCode = response.statusCode;
    if (statusCode == 400) return "Bad request. Please check input.";
    if (statusCode == 401) return "Unauthorized. Please login again.";
    if (statusCode == 403) return "Forbidden access.";
    if (statusCode == 404) return "Resource not found.";
    if (statusCode == 500) return "Internal server error. Try again later.";
    return "Received error status: $statusCode";
  }
}
