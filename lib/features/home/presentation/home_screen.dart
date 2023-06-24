import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../assets/colors.dart';
import '../../../core/data/service_locator.dart';
import '../../saved_news/presentation/bloc/saved_news_bloc.dart';
import '../../saved_news/presentation/saved_news_page.dart';
import '../../search/presenation/bloc/search_bloc.dart';
import '../../search/presenation/search_page.dart';
import 'pages/home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    //initialize
    homeSwipeController = AppinioSwiperController();
    savedNewsSwipeController = AppinioSwiperController();
    searchController = TextEditingController();

    pages = [
      MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: sl<SavedNewsBloc>(),
          ),
        ],
        child: HomePage(controller: homeSwipeController),
      ),
      MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: sl<SearchBloc>(),
          ),
          BlocProvider.value(
            value: sl<SavedNewsBloc>(),
          ),
        ],
        child: SearchPage(
          searchController: searchController,
        ),
      ),
      BlocProvider.value(
        value: sl<SavedNewsBloc>()
          ..add(const SavedNewsEvent.getNewsFromStorage()),
        child: SavedNewsPage(swiperController: savedNewsSwipeController),
      ),
    ];
    super.initState();
  }

  int indexPage = 0;
  late final List pages;
  late final AppinioSwiperController savedNewsSwipeController;
  late final AppinioSwiperController homeSwipeController;
  late final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(
          child: Column(
            children: [Icon(Icons.topic_rounded)],
          ),
        ),
        backgroundColor: black,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            pages[indexPage],
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: black, borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton.filled(
                iconSize: 35,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((_) {
                    if (indexPage == 0) return white;
                    return darkGrey;
                  }),
                ),
                onPressed: () {
                  if (indexPage != 0) {
                    setState(() {
                      indexPage = 0;
                    });
                  }
                },
                icon: Icon(
                  Icons.home,
                  color: indexPage == 0 ? black : white,
                ),
              ),
              const SizedBox(width: 8),
              IconButton.filled(
                iconSize: 35,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (_) {
                      if (indexPage == 1) return white;
                      return darkGrey;
                    },
                  ),
                ),
                onPressed: () {
                  if (indexPage != 1) {
                    setState(() {
                      indexPage = 1;
                    });
                  }
                },
                icon: Icon(
                  Icons.search_rounded,
                  color: indexPage == 1 ? black : white,
                ),
              ),
              const SizedBox(width: 8),
              IconButton.filled(
                iconSize: 35,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((_) {
                  if (indexPage == 2) return white;
                  return darkGrey;
                })),
                onPressed: () {
                  if (indexPage != 2) {
                    setState(() {
                      indexPage = 2;
                    });
                  }
                },
                icon: Icon(
                  Icons.bookmark_border_rounded,
                  color: indexPage == 2 ? black : white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
