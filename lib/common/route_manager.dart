import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/pages/comments_page.dart';
import 'package:flutter_bloc_app/pages/articles_page.dart';

class RouteManager {
  RouteManager._();

  static String getInitialRoute() {
    return ArticlesPage.route;
  }

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      ArticlesPage.route: (context) => ArticlesPage(),
      CommentsPage.route: (context) => CommentsPage(),
    };
  }
}
