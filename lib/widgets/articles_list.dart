import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/article/article_bloc.dart';
import 'package:flutter_bloc_app/bloc/article/article_state.dart';
import 'package:flutter_bloc_app/model/article.dart';
import 'package:flutter_bloc_app/widgets/error_message.dart';

class ArticlesList extends StatelessWidget {
  const ArticlesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArticleBloc, ArticleState>(
      listener: (context, state) {
        print(state.toString());
      },
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
              return Text(article.title);
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
