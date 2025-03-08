class NewsArguments {
  String? newsURL;
  String? newsData;

  NewsArguments({
    this.newsURL,
    this.newsData,
  });

  NewsArguments copyWith({
    String? newsData,
    String? newsURL,
  }) =>
      NewsArguments(
        newsData: newsData ?? this.newsData,
        newsURL: newsURL ?? this.newsURL,
      );
}
