import 'package:news_app/core/data/either.dart';

import '../../../../core/error/failure.dart';

abstract class NewsLocalDataSource {
  Future<Either<CacheFailure, void>> saveBlocProperties({required});
}

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  @override
  Future<Either<CacheFailure, void>> saveBlocProperties({required}) {
    // TODO: implement saveBlocProperties
    throw UnimplementedError();
  }
}
