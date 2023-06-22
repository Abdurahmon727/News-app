import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/home/presentation/pages/choose_topic_page.dart';

import 'core/data/service_locator.dart';
import 'core/data/storage_repository.dart';

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
    return BlocProvider.value(
      value: sl<NewsBloc>(),
      child: MaterialApp(
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
        home: ChooseTopicPage(),
      ),
    );
  }
}
