import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class ArticleList {
  final String status;
  final int totalResults;
  final List<Article> articles;

  ArticleList(
      {required this.status,
      required this.totalResults,
      required this.articles});

  factory ArticleList.fromJson(Map<String, dynamic> json) =>
      _$ArticleListFromJson(json);
}

@JsonSerializable()
// @JsonSerializable(includeIfNull: false)
class Article {
  final ArticleSource source;
  final String? author;
  final String title;
  final String description;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final String content;

  Article({
    required this.source,
    this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}

@JsonSerializable(includeIfNull: false)
class ArticleSource {
  final String? id;
  final String name;

  ArticleSource({
    this.id,
    required this.name,
  });

  factory ArticleSource.fromJson(Map<String, dynamic> json) =>
      _$ArticleSourceFromJson(json);
}
