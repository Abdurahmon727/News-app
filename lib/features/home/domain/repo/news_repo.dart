import 'package:news_app/core/data/either.dart';
import 'package:news_app/core/error/failure.dart';

import '../../data/models/news.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<NewsModel>>> getNews();
}
