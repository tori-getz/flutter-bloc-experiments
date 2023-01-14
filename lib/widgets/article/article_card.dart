import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/model/article.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({super.key, required this.article});

  Widget _getImage() {
    if (article.urlToImage == null) return const SizedBox.shrink();

    return Image.network(article.urlToImage!);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          _getImage(),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text(article.title),
            subtitle: Text(article.description),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
