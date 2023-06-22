import 'package:get_it/get_it.dart';

import '../../features/home/data/models/objectbox_singleton.dart';
import '../../features/home/presentation/bloc/news_bloc.dart';
import '../../features/saved_news/presentation/bloc/saved_news_bloc.dart';
import '../../features/search/presenation/bloc/search_bloc.dart';
import 'dio_settings.dart';
import 'network_info.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  sl.registerLazySingleton(DioSettings.new);
  sl.registerLazySingleton<NetworkInfo>(() => const NetworkInfoImpl());
  sl.registerLazySingleton(() => SavedNewsBloc());
  sl.registerLazySingleton(() => SearchBloc());
  sl.registerLazySingleton(() => NewsBloc());

  //objectbox
  final objectbox = await ObjectBoxSingleton.create();
  sl.registerLazySingleton(() => objectbox);
}
