import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsStoreNotifier extends StateNotifier<List<String>> {
  NewsStoreNotifier() : super([]);

  static const String searchData = 'searchData';

  Future<void> loadSearch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    state = prefs.getStringList(searchData) ?? [];
  }

  Future<void> saveSearch(String query) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (!state.contains(query)) {
      state = [query, ...state];
    }
    await prefs.setStringList(searchData, state);
  }

//////////////////////////////
///// REMOVE ALL QUERIES
//////////////////////////////
  Future<void> clearSearch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    state = [];
    await prefs.remove(searchData);
  }

//////////////////////////////
///// REMOVE SINGLE QUERY
//////////////////////////////
  Future<void> removeSearch(String query) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    state = state.where((item) => item != query).toList();
    await prefs.setStringList(searchData, state);
  }
}

final newsStoreProvider =
    StateNotifierProvider<NewsStoreNotifier, List<String>>((ref) {
  return NewsStoreNotifier();
});
