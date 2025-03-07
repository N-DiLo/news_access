import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_access/core/services/news_network.dart';

class NewsRepository {
  final Dio dio;

  NewsRepository(this.dio);

  Future<Map<String, dynamic>?> getNews({String? query}) async {
    final endpoint = '/everything?q=$query';

    try {
      final response = await NewsNetwork.get(endpoint: endpoint);

      if (response != null) {
        log('API Response: $response');
        return response;
      }
      return null;
    } catch (e) {
      log('Error fetching data: ${e.toString()}');
      throw Exception('Error: $e');
    }
  }
}
