import 'package:flutter/material.dart';
import 'package:news_app/widgets/custom_category_list.dart';
import 'package:news_app/widgets/custom_news_tile_list_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'News',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                'Cloud',
                style: TextStyle(color: Colors.orange),
              )
            ],
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: CustomCategoryList(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 30),
              ),
              CustomNewsTileListBuilder(category: 'general'),
            ],
          ),
        ));
  }
}
