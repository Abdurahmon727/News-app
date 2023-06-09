import 'package:appinio_swiper/appinio_swiper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/assets/colors.dart';
import 'package:news_app/core/models/formz/formz_status.dart';
import 'package:news_app/features/home/presentation/widgets/preview_news.dart';

import 'bloc/news_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = AppinioSwiperController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc()..add(const NewsEvent.getNews()),
      child: Scaffold(
        backgroundColor: black,
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state.status == FormzStatus.submissionSuccess) {
              final data = state.models;
              return Column(
                children: [
                  Expanded(
                    child: AppinioSwiper(
                      duration: const Duration(milliseconds: 300),
                      controller: controller,
                      padding: const EdgeInsets.all(20),
                      cardsBuilder: (context, index) {
                        return WPreviewNews(model: data[index]);
                      },
                      cardsCount: data.length,
                    ),
                  ),
                ],
              );
            } else if (state.status == FormzStatus.submissionInProgress) {
              return CircularProgressIndicator();
            } else {
              return Center(
                child: Text(state.errorMessage),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.recent_actors),
          onPressed: () {
            controller.unswipe();
          },
        ),
      ),
    );
  }
}
