import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'assets/constants.dart';
import 'features/saved_news/presentation/bloc/saved_news_bloc.dart';

import 'assets/theme.dart';
import 'core/bloc/theme/theme_bloc.dart';
import 'core/data/service_locator.dart';
import 'core/data/storage_repository.dart';
import 'core/splash/splash.dart';
import 'features/home/presentation/bloc/news_bloc.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/home/presentation/pages/choose_topic_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await StorageRepository.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get navigator => navigatorKey.currentState!;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: sl<NewsBloc>()..add(const NewsEvent.init()),
        ),
        BlocProvider(
          create: (context) => ThemeBloc()..add(const ThemeEvent.load()),
        ),
        BlocProvider(
          create: (context) => sl<SavedNewsBloc>()
            ..add(const SavedNewsEvent.getNewsFromStorage()),
        ),
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          title: 'News app',
          themeMode: context.watch<ThemeBloc>().state.useSystemTheme
              ? ThemeMode.system
              : context.read<ThemeBloc>().state.isLight
                  ? ThemeMode.light
                  : ThemeMode.dark,
          darkTheme: AppTheme.darkTheme().copyWith(
              primaryColor: themePrimaryColors[
                  context.read<ThemeBloc>().state.primaryColorIndex]),
          theme: AppTheme.lightTheme().copyWith(
              primaryColor: themePrimaryColors[
                  context.read<ThemeBloc>().state.primaryColorIndex]),
          home: const SplashScreen(),
          builder: (context, child) {
            return BlocListener<NewsBloc, NewsState>(
              listenWhen: (previous, current) =>
                  previous.topics != current.topics,
              listener: (context, state) {
                if (state.topics.isEmpty) {
                  navigator.pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const ChooseTopicPage()),
                      (route) => false);
                } else {
                  navigator.pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                      (route) => false);
                }
              },
              child: child ?? const SplashScreen(),
            );
          },
        );
      }),
    );
  }
}
