import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../assets/colors.dart';
import '../../../core/models/formz/formz_status.dart';
import 'bloc/news_bloc.dart';
import 'widgets/preview_news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    controller.addListener(() {
      print(controller.state?.index);
    });

    super.initState();
  }

  final controller = AppinioSwiperController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc()..add(const NewsEvent.getNews()),
      child: SafeArea(
        child: DefaultTabController(
          initialIndex: 0,
          length: 4,
          child: Scaffold(
            backgroundColor: black,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'Z-News',
                    style: TextStyle(
                        color: white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: TabBar(
                      onTap: (value) {
                        //TODO
                      },
                      dividerColor: Colors.transparent,
                      indicator: const BoxDecoration(),
                      labelColor: white,
                      unselectedLabelStyle: const TextStyle(fontSize: 16),
                      isScrollable: true,
                      labelStyle: const TextStyle(
                        color: white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      labelPadding: const EdgeInsets.all(8),
                      tabs: const [
                        Text('Trending'),
                        Text('Health'),
                        Text('Sports'),
                        Text('Finance'),
                      ]),
                ),
                BlocBuilder<NewsBloc, NewsState>(
                  buildWhen: (previous, current) =>
                      previous.status != current.status,
                  builder: (context, state) {
                    if (state.status == FormzStatus.submissionSuccess) {
                      final data = state.models;
                      return Expanded(
                        child: AppinioSwiper(
                          unlimitedUnswipe: true,
                          onEnd: () {
                            context
                                .read<NewsBloc>()
                                .add(const NewsEvent.getNews());
                          },
                          duration: const Duration(milliseconds: 300),
                          controller: controller,
                          padding: const EdgeInsets.all(20),
                          cardsBuilder: (context, index) {
                            return WPreviewNews(model: data[index]);
                          },
                          cardsCount: data.length,
                        ),
                      );
                    } else if (state.status ==
                        FormzStatus.submissionInProgress) {
                      return const Center(
                          child: CircularProgressIndicator.adaptive());
                    } else {
                      return Center(
                        child: Text(
                          state.errorMessage,
                          style: const TextStyle(color: white),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.history),
              onPressed: () {
                controller.unswipe();
              },
            ),
          ),
        ),
      ),
    );
  }
}
