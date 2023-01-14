import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/article/article_bloc.dart';
import 'package:flutter_bloc_app/bloc/article/article_state.dart';
import 'package:flutter_bloc_app/model/article.dart';
import 'package:flutter_bloc_app/widgets/article/article_card.dart';
import 'package:flutter_bloc_app/widgets/ui/error_message.dart';

class ArticlesList extends StatelessWidget {
  const ArticlesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArticleBloc, ArticleState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ArticleLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ArticleErroState) {
          return const ErrorMessage(message: 'Error');
        }

        if (state is ArticleLoadedState) {
          return ListView.builder(
            itemCount: state.articles.length,
            itemBuilder: (context, index) {
              Article article = state.articles[index];
              return ArticleCard(article: article);
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
