import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/custom_news_tile_list.dart';

class CustomNewsTileListBuilder extends StatefulWidget {
  const CustomNewsTileListBuilder({super.key, required this.category});
  final String category;

  @override
  State<CustomNewsTileListBuilder> createState() =>
      _CustomNewsTileListBuilderState();
}

class _CustomNewsTileListBuilderState extends State<CustomNewsTileListBuilder> {
  late Future<List<ArticleModel>> articles;
  @override
  void initState() {
    super.initState();
    articles = NewsService(Dio()).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: articles,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CustomNewsTileList(articles: snapshot.data ?? []);
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Text('oops there was an error, try later'),
          );
        } else {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
