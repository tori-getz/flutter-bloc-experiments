import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/article/article_bloc.dart';
import 'package:flutter_bloc_app/bloc/article/article_event.dart';
import 'package:flutter_bloc_app/cubit/internet_cubit.dart';
import 'package:flutter_bloc_app/model/article.dart';
import 'package:flutter_bloc_app/services/article_repository.dart';
import 'package:flutter_bloc_app/widgets/article/articles_app_bar.dart';
import 'package:flutter_bloc_app/widgets/article/articles_list.dart';
import 'package:flutter_bloc_app/widgets/ui/error_message.dart';

class ArticlesPage extends StatelessWidget {
  static const String route = '/';

  Widget _getBody(BuildContext context, InternetConnectionState state) {
    ArticleBloc articleBloc = context.read<ArticleBloc>();

    if (!state.connected) {
      return const ErrorMessage(message: 'Please, check internet connection');
    }

    return RefreshIndicator(
      child: ArticlesList(),
      onRefresh: () async {
        articleBloc.add(ArticleLoadEvent());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => ArticleRepository(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => ArticleBloc(
                    articleRepository: context.read<ArticleRepository>())
                  ..add(ArticleLoadEvent())),
            BlocProvider(create: (context) => InternetCubit()),
          ],
          child: Scaffold(
            appBar: const ArticlesAppBar(),
            body: BlocBuilder<InternetCubit, InternetConnectionState>(
              builder: _getBody,
            ),
          ),
        ));
  }
}
