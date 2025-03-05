class NewsArguments {
  String? newsURL;
  String? newsDate;

  NewsArguments({
    this.newsURL,
    this.newsDate,
  });

  NewsArguments copyWith({
    String? newsDate,
    String? newsURL,
  }) =>
      NewsArguments(
        newsDate: newsDate ?? this.newsDate,
        newsURL: newsURL ?? this.newsURL,
      );
}
