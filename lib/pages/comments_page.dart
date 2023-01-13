import 'package:flutter/material.dart';

class CommentsPage extends StatelessWidget {
  static const String route = '/comments';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: Center(
        child: Text('comments'),
      ),
    );
  }
}
