import 'package:flutter_bloc_app/common/network/dio_client.dart';
import 'package:flutter_bloc_app/common/network/endpoints.dart';
import 'package:flutter_bloc_app/model/article.dart';

class ArticleProvider {
  final _http = DioClient();

  Future<List<Article>> getArticles() async {
    final response = await _http.dio.get(Endpoints.articles);

    if (response.statusCode != 200) {
      throw Exception('Error: ${response.statusMessage}');
    }

    ArticleList articleList = ArticleList.fromJson(response.data);

    return articleList.articles;
  }
}
