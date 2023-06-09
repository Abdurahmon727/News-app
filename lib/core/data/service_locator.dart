import 'package:get_it/get_it.dart';
import 'package:news_app/core/data/network_info.dart';
import 'package:news_app/features/home/data/datasources/news_remote_data_source.dart';

import 'dio_settings.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(DioSettings.new);
  getIt.registerLazySingleton<NetworkInfo>(() => const NetworkInfoImpl());
  getIt.registerLazySingleton<NewsRemoteDataSource>(
      () => NewsRemoteDataSourceImpl());
}
