import 'package:dio/dio.dart';
import 'package:news_access/core/shared/utils/news_toast.dart';
import 'package:toastification/toastification.dart';

class NewsErrorHandler {
  static const _duration = Duration(seconds: 3);

  static void errorHanler(DioException e) {
    String message = _errorMessages(e);
    NewsToast.show(
      showIcon: false,
      autoCloseDuration: _duration,
      message: message,
      type: ToastificationType.error,
      toastStyle: ToastificationStyle.fillColored,
    );
  }

  static String _errorMessages(DioException e) {
    if (e.response != null) {
      final statusCode = e.response?.statusCode;
      switch (statusCode) {
        case 400:
          return 'Bad request: Something went wrong. Please try again.';
        case 401:
          return 'You don’t have permission to view this page.';
        case 404:
          return 'Oops! We couldn’t find the page you were looking for.';
        case 429:
          return 'Multiple attempts detected, please wait a moment.';
        case 500:
          return 'Temporary server issue. Please try again later.';

        default:
          return 'Unexpected error. Please try again!';
      }
    } else {
      return _timeoutErrors(e);
    }
  }

  static String _timeoutErrors(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return 'Connection timed out. Please try again.';
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return 'Response timed out. Please try again.';
    } else if (e.type == DioExceptionType.connectionError) {
      return 'Connection failed. The server might be down or unreachable.';
    } else if (e.type == DioExceptionType.unknown) {
      return 'No internet connection or server is unreachable.';
    } else {
      return 'Unexpected error. Please try again.';
    }
  }
}
