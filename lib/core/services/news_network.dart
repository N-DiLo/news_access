import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_access/core/services/news_error_handler.dart';

const String baseURL = String.fromEnvironment('BASE_URL');
const String apiKEY = String.fromEnvironment('API_KEY');

class NewsNetwork {
  static const int serverTIMEOUT = 60;
  static const duration = Duration(seconds: serverTIMEOUT * 10000);

  static Future<Options> _getOptions() async {
    final newHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': apiKEY,
    };
    return Options(headers: newHeaders);
  }

  static final dio = Dio(
    BaseOptions(
      baseUrl: baseURL,
      connectTimeout: duration,
      receiveTimeout: duration,
    ),
  )..interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final dioOptions = await _getOptions();
          options.headers.addAll(dioOptions.headers ?? {});
          return handler.next(options);
        },
        onError: (error, handler) => handler.next(error),
      ),
      LogInterceptor(
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      )
    ]);

  static Future<dynamic> get({required endpoint}) async {
    try {
      final dioOptions = await _getOptions();
      final response = await dio.get(
        endpoint,
        options: Options(
          headers: dioOptions.headers,
        ),
      );
      log('SUCCESS: ${response.data}');
      return response.data;
    } on DioException catch (error) {
      _dioErrorHandler(error);
    }
  }

  static void _dioErrorHandler(DioException error) {
    if (error.response != null) {
      log('Error Occurred: ${error.response?.data}');
      return NewsErrorHandler.errorHanler(error);
    } else {
      log('Message: ${error.message}');
    }
  }
}
