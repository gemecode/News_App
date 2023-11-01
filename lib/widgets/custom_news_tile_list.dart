import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/custom_news_tile.dart';

class CustomNewsTileList extends StatelessWidget {
  const CustomNewsTileList({super.key, required this.articles});
  final List<ArticleModel> articles;

  // bool isLoading = true;
  // Future<void> getNews() async {
  //   articles = await NewsService(Dio()).getNews();
  //   isLoading = false;
  // }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CustomNewsTile(articleModel: articles[index]),
          );
        },
      ),
    );
  }
}
