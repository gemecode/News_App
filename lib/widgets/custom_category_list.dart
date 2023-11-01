import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/custom_category_card.dart';

class CustomCategoryList extends StatelessWidget {
  const CustomCategoryList({super.key});

  final List<CategoryModel> categories = const [
    CategoryModel(
      categoryImage: 'assets/business.jpg',
      categoryName: 'Business',
    ),
    CategoryModel(
      categoryImage: 'assets/entertaiment.jpg',
      categoryName: 'Entertainment',
    ),
    CategoryModel(
      categoryImage: 'assets/health.jpg',
      categoryName: 'Health',
    ),
    CategoryModel(
      categoryImage: 'assets/science.jpg',
      categoryName: 'Science',
    ),
    CategoryModel(
      categoryImage: 'assets/sports.jpg',
      categoryName: 'Sports',
    ),
    CategoryModel(
      categoryImage: 'assets/technology.jpg',
      categoryName: 'Technology',
    ),
    CategoryModel(
      categoryImage: 'assets/general.jpg',
      categoryName: 'General',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => CustomCategoryCard(
          categoryModel: categories[index],
        ),
      ),
    );
  }
}
