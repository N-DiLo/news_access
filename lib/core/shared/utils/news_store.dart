import 'package:shared_preferences/shared_preferences.dart';

class NewsStore {
  static const String searchData = 'searchData';
  List<String> _searchHistory = [];
  Future<void> loadSearch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _searchHistory = prefs.getStringList(searchData) ?? [];
  }

  Future<void> saveSearch(String query) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (!_searchHistory.contains(query)) {
      _searchHistory.insert(0, query);
    }

    await prefs.setStringList(searchData, _searchHistory);
  }

  List<String> getSearchHistory() {
    return _searchHistory;
  }

  Future<void> clearSearch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _searchHistory.clear();
    await prefs.remove(searchData);
  }
}
