import 'package:news_app/core/error/exeptions.dart';

import '../../../../core/data/either.dart';
import '../../../../core/data/network_info.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repo/news_repo.dart';
import '../datasources/news_remote_data_source.dart';
import '../models/news.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl({required this.page});
  final int page;
  final _networkInfo = const NetworkInfoImpl();

  @override
  Future<Either<Failure, (List<NewsModel>, int)>> getNews() async {
    if (await _networkInfo.connected) {
      try {
        final result = await NewsRemoteDataSourceImpl(page).getNews();
        return Right((result.$1, result.$2));
      } on ServerException {
        rethrow;
      } catch (e) {
        return Left(ServerFailure(
            errorMessage: 'Something went wrong', statusCode: 500));
      }
    } else {
      return Left(ServerFailure(errorMessage: 'No Internet'));
    }
  }
}
