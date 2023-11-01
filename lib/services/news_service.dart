import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  // final dio = Dio();

  NewsService(this.dio);
  final Dio dio;

  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?apiKey=0bd89bd7faa148a0bad93fb603fc6bc6&country=us&category=$category');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articlesList = [];
      for (var article in articles) {
        if (article['urlToImage'] != null) {
          ArticleModel articleModel = ArticleModel(
              image: article['urlToImage'],
              title: article['title'],
              subTitle: article['description'],
              url: article['url']);
          articlesList.add(articleModel);
        }
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
