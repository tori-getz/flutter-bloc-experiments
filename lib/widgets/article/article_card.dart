import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/model/article.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({super.key, required this.article});

  Widget _getImage(BuildContext context) {
    if (article.urlToImage == null) return const SizedBox.shrink();

    return ExtendedImage.network(
      article.urlToImage!,
      loadStateChanged: (state) {
        LoadState loadState = state.extendedImageLoadState;

        if (loadState == LoadState.completed) {
          return ExtendedRawImage(
            image: state.extendedImageInfo?.image,
          );
        }

        if (loadState == LoadState.loading) {
          return Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[900],
            padding: const EdgeInsets.all(20),
            child: Column(children: const [
              CircularProgressIndicator(
                color: Colors.white,
              )
            ]),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          _getImage(context),
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
