import 'dart:core';

class ArticleModel {
  late String author;
  late String title;
  late String description;
  late String url;
  late String content;
  late String urlToImage;
  ArticleModel({
    this.author = "",
    required this.title,
    required this.description,
    required this.url,
    required this.content,
    required this.urlToImage,
  });
}
