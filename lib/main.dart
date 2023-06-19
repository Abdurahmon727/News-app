import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/data/service_locator.dart';
import 'core/data/storage_repository.dart';
import 'features/home/presentation/bloc/news_bloc.dart';
import 'features/home/presentation/home_screen.dart';

late var objectBox;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await StorageRepository.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News app',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => NewsBloc()..add(const NewsEvent.getNews()),
        child: const HomeScreen(),
      ),
    );
  }
}
