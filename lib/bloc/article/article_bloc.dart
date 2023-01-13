import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/article/article_event.dart';
import 'package:flutter_bloc_app/bloc/article/article_state.dart';
import 'package:flutter_bloc_app/model/article.dart';
import 'package:flutter_bloc_app/services/article_repository.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleRepository articleRepository;
  ArticleBloc({required this.articleRepository}) : super(ArticleEmptyState()) {
    on<ArticleLoadEvent>((event, emit) async {
      emit(ArticleLoadingState());

      try {
        final List<Article> loadedArticles =
            await articleRepository.getAllArticles();
        emit(ArticleLoadedState(articles: loadedArticles));
      } catch (e) {
        emit(ArticleErroState());
      }
    });
  }
}
