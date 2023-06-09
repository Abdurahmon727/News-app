import 'package:get_it/get_it.dart';

import '../../features/home/data/datasources/news_remote_data_source.dart';
import 'dio_settings.dart';
import 'network_info.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(DioSettings.new);
  getIt.registerLazySingleton<NetworkInfo>(() => const NetworkInfoImpl());
  getIt.registerLazySingleton<NewsRemoteDataSource>(
      () => NewsRemoteDataSourceImpl());
}
