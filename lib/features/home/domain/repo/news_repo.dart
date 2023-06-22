import 'package:news_app/core/data/either.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/core/models/home_datas.dart';

import '../../data/models/news.dart';

abstract class NewsRepository {
  Future<Either<Failure, (List<NewsModel>, int)>> getNews(
      {required int topicIndex,
      required List<String> resources,
      required Calendar calendar,
      required List<String> languages,
      required List<String> topics});
}
