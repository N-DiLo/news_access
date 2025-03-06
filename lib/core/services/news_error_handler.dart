import 'package:dio/dio.dart';
import 'package:news_access/core/shared/utils/news_toast.dart';
import 'package:toastification/toastification.dart';

class NewsErrorHandler {
  static const _duration = Duration(seconds: 2);

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
      final result = e.response?.data;
      switch (e.response?.statusCode) {
        case 400:
          return result?['message'] ?? 'Bad request';
        case 401:
          return result?['message'] ?? 'Unauthorized access';
        case 404:
          return result?['message'] ?? 'Page Not Found';
        case 429:
          return result?['message'] ?? 'Too many attempts';
        case 500:
          return result?['message'] ?? 'Server error. Try again!';

        default:
          return result?['message'] ?? 'Unexpected error. Please try again!';
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
