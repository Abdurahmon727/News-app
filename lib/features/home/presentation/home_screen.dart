import 'package:appinio_swiper/appinio_swiper.dart';

import 'package:flutter/material.dart';
import 'package:news_app/assets/colors.dart';
import 'package:news_app/features/home/presentation/widgets/preview_news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = AppinioSwiperController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Column(
        children: [
          Expanded(
            child: AppinioSwiper(
              duration: const Duration(milliseconds: 300),
              controller: controller,
              padding: const EdgeInsets.all(20),
              cardsBuilder: (context, index) {
                return WPreviewNews();
              },
              cardsCount: 100,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.recent_actors),
        onPressed: () {
          controller.unswipe();
        },
      ),
    );
  }
}
