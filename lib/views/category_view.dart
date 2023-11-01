import 'package:flutter/material.dart';
import 'package:news_app/widgets/custom_news_tile_list_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            CustomNewsTileListBuilder(
              category: category,
            )
          ],
        ),
      ),
    );
  }
}
