import 'package:flutter_bloc_app/model/article.dart';

abstract class ArticleState {}

class ArticleLoadingState extends ArticleState {}

class ArticleEmptyState extends ArticleState {}

class ArticleLoadedState extends ArticleState {
  List<Article> articles;
  ArticleLoadedState({
    required this.articles,
  });
}

class ArticleErroState extends ArticleState {}
