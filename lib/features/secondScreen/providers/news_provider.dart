import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_access/core/services/news_network.dart';
import 'package:news_access/features/secondScreen/data/news_repository.dart';
import 'package:news_access/features/secondScreen/data/news_service.dart';
import 'package:news_access/features/secondScreen/domain/news_notifier.dart';

final newsProvider = Provider<NewsRepository>(
  (ref) => NewsRepository(NewsNetwork.dio),
);

final newsServiceProvider = Provider<NewsService>(
  (ref) => NewsService(
    ref.read(newsProvider),
  ),
);

final newsNotifierProvider = StateNotifierProvider<NewsNotifier, NewsState>(
  (ref) => NewsNotifier(
    ref.read(newsServiceProvider),
  ),
);
