import 'package:flutter_bloc_app/model/article.dart';
import 'package:flutter_bloc_app/services/article_provider.dart';

class ArticleRepository {
  ArticleProvider _articleProvider = ArticleProvider();
  Future<List<Article>> getAllArticles() => _articleProvider.getArticles();
}
