import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/article/article_bloc.dart';
import 'package:flutter_bloc_app/bloc/article/article_event.dart';
import 'package:flutter_bloc_app/bloc/article/article_state.dart';

class ArticlesAppBar extends StatelessWidget with PreferredSizeWidget {
  const ArticlesAppBar({super.key});

  List<Widget> _getActions(BuildContext context, ArticleState state) {
    final articleBloc = context.read<ArticleBloc>();

    if (state is ArticleLoadingState) {
      return [
        Opacity(
          opacity: 0.5,
          child: IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          ),
        ),
      ];
    }

    return [
      IconButton(
        icon: Icon(Icons.refresh),
        onPressed: () {
          articleBloc.add(ArticleLoadEvent());
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArticleBloc, ArticleState>(
      listener: (context, state) {},
      builder: (context, state) {
        return AppBar(
            title: const Text('Articles'),
            actions: _getActions(context, state));
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
