import '../../../../core/data/either.dart';
import '../../../../core/data/network_info.dart';
import '../../../../core/error/failure.dart';
import '../../../home/data/models/news.dart';
import '../../domain/repository/search_repo.dart';
import '../data_source/remote_data_source.dart';

class SearchRepositoryImpl implements SearchRepository {
  final NetworkInfo _networkInfo = const NetworkInfoImpl();
  final _remoteDataSource = SearchRemoteDataSourceImpl();

  @override
  Future<Either<Failure, List<NewsModel>>> getSearchResults(
      String query) async {
    if (await _networkInfo.connected) {
      // try {
      final data = await _remoteDataSource.getSearchResult(query);
      return Right(data);
      // } on ServerException catch (e) {
      //   return Left(
      //     ServerFailure(
      //         errorMessage: e.statusMessage, statusCode: e.statusCode.toInt()),
      //   );
      // } catch (e) {
      //   return Left(const ServerFailure(errorMessage: 'Something went wrong'));
      // }
    } else {
      return Left(const ServerFailure(errorMessage: 'No internet'));
    }
  }
}
