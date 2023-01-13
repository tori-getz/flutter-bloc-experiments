import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/article/article_bloc.dart';
import 'package:flutter_bloc_app/bloc/article/article_event.dart';
import 'package:flutter_bloc_app/bloc/article/article_state.dart';
import 'package:flutter_bloc_app/common/network/endpoints.dart';
import 'package:flutter_bloc_app/services/article_repository.dart';
import 'package:flutter_bloc_app/widgets/articles_list.dart';

class ArticlesPage extends StatelessWidget {
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => ArticleRepository(),
        child: BlocProvider(
          create: (context) =>
              ArticleBloc(articleRepository: context.read<ArticleRepository>())
                ..add(ArticleLoadEvent()),
          child: Scaffold(
            appBar: AppBar(
              title: Text('Articles'),
            ),
            body: ArticlesList(),
          ),
        ));
  }
}
