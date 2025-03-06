import 'dart:developer';

import 'package:news_access/features/secondScreen/data/news_repository.dart';

class NewsService {
  final NewsRepository newsRepository;

  NewsService(this.newsRepository);

  Future<Map<String, dynamic>?> getNews({String? query}) async {
    try {
      final response = await newsRepository.getNews(query: query);
      return Future.value(response);
    } catch (e) {
      log('Service error: ${e.toString()}');
      throw Exception('Error: $e');
    }
  }
}
