import 'package:get_it/get_it.dart';

import 'dio_settings.dart';
import 'network_info.dart';
import '../../features/home/data/models/objectbox_singleton.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  sl.registerLazySingleton(DioSettings.new);
  sl.registerLazySingleton<NetworkInfo>(() => const NetworkInfoImpl());

  final objectbox = await ObjectBoxSingleton.create();
  sl.registerSingleton(objectbox);
}
