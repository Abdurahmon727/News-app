import 'package:news_app/core/error/exeptions.dart';

import '../../../../core/data/either.dart';
import '../../../../core/data/network_info.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repo/news_repo.dart';
import '../datasources/news_remote_data_source.dart';
import '../models/news.dart';

class NewsRepositoryImpl implements NewsRepository {
  final _networkInfo = const NetworkInfoImpl();
  final _remoteDataSource = NewsRemoteDataSourceImpl();
  @override
  Future<Either<Failure, List<NewsModel>>> getNews() async {
    if (await _networkInfo.connected) {
      try {
        final result = await _remoteDataSource.getNews();
        return Right(result);
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
