import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/web_view.dart';

class CustomNewsTile extends StatelessWidget {
  const CustomNewsTile({super.key, required this.articleModel});
  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebView(url: articleModel.url),
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              articleModel.image!,
              // ??'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            articleModel.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 5),
          Text(
            articleModel.subTitle ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
