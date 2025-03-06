import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_access/features/secondScreen/data/entities/news_models.dart';
import 'package:news_access/features/secondScreen/data/news_service.dart';

class NewsState {
  bool isLoading;
  final bool status;

  final String message;
  bool nextPage;
  NewsModel? newsModel;

  NewsState({
    this.isLoading = false,
    required this.status,
    required this.message,
    this.newsModel,
    this.nextPage = false,
  });

  NewsState copyWith(
          {bool? isLoading,
          bool? nextPage,
          String? message,
          NewsModel? newsModel,
          bool? status}) =>
      NewsState(
        message: message ?? this.message,
        newsModel: newsModel ?? this.newsModel,
        isLoading: isLoading ?? this.isLoading,
        nextPage: nextPage ?? this.nextPage,
        status: status ?? this.status,
      );
}

class NewsNotifier extends StateNotifier<NewsState> {
  final NewsService newsService;
  NewsNotifier(this.newsService)
      : super(NewsState(
          status: false,
          message: 'Loading...',
          isLoading: true,
        ));

  Future<void> getNews({String? query}) async {
    try {
      final result = await newsService.getNews(query: query);
      if (result != null && result.isNotEmpty) {
        final newsData = NewsModel.fromJson(result);
        state = NewsState(
          isLoading: false,
          status: true,
          message: 'Fetched news',
          newsModel: newsData,
        );
      } else if (result != null && result.isEmpty) {
        state = NewsState(
          isLoading: false,
          status: false,
          message: 'No news data found',
        );
      }
    } catch (e) {
      log('Error occurred: ${e.toString()} ');
      throw Exception('Error: $e');
    }
  }
}
