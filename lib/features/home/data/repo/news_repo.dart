import 'package:news_app/core/data/either.dart';

import 'package:news_app/core/error/failure.dart';

import 'package:news_app/features/home/data/models/news.dart';

import '../../domain/repo/news_repo.dart';

class NewsRepositoryImpl implements NewsRepository {
  @override
  Future<Either<NewsModel, Failure>> getNews() {
    throw UnimplementedError();
  }
}
