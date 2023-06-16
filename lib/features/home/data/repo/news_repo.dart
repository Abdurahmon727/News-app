import '../../../../core/data/either.dart';
import '../../../../core/data/network_info.dart';
import '../../../../core/error/exeptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/home_datas.dart';
import '../../domain/repo/news_repo.dart';
import '../datasources/news_remote_data_source.dart';
import '../models/news.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl({required this.page});
  final int page;
  final _networkInfo = const NetworkInfoImpl();

  @override
  Future<Either<Failure, (List<NewsModel>, int)>> getNews({
    required int topicIndex,
    required List<String> resources,
    required List<String> languages,
    required Calendar calendar,
  }) async {
    if (await _networkInfo.connected) {
      try {
        final result = await NewsRemoteDataSourceImpl(page).getNews(
            langauges: languages,
            calendar: calendar,
            resources: resources,
            topicIndex: topicIndex);
        return Right((result.$1, result.$2));
      } on ServerException catch (e) {
        return Left(ServerFailure(
            errorMessage: e.statusMessage, statusCode: e.statusCode));
      } catch (e) {
        return Left(ServerFailure(
            errorMessage: 'Something went wrong ', statusCode: 500));
      }
    } else {
      return Left(ServerFailure(errorMessage: 'No Internet'));
    }
  }
}
