import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';

import '../../../assets/colors.dart';
import '../../../core/models/home_datas.dart';
import 'pages/home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    controller = AppinioSwiperController();
    controller.addListener(() {
      print(controller.state!.index);
    });
    pages = [
      HomePage(controller: controller),
      SizedBox(),
      SizedBox(),
    ];
    super.initState();
  }

  int indexPage = 0;
  late final List pages;
  late final AppinioSwiperController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: homeTopics.length,
        child: Scaffold(
          backgroundColor: black,
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              pages[indexPage],
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            height: 50,
            decoration: BoxDecoration(
                color: black, borderRadius: BorderRadius.circular(30)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton.filled(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith((_) {
                    if (indexPage == 0) return white;
                    return darkGrey;
                  })),
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
                IconButton.filled(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith((_) {
                    if (indexPage == 1) return white;
                    return darkGrey;
                  })),
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
                IconButton.filled(
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
          // floatingActionButton: FloatingActionButton(
          //   child: const Icon(Icons.history),
          //   onPressed: () {
          //     controller.unswipe();
          //   },
          // ),
        ),
      ),
    );
  }
}
