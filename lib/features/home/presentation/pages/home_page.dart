import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../assets/colors.dart';
import '../../../../core/models/formz/formz_status.dart';
import '../../../../core/models/home_datas.dart';
import '../../../../core/widgets/appino_swiper/appino_swiper.dart';
import '../../../saved_news/presentation/bloc/bloc/saved_news_bloc.dart';
import '../bloc/news_bloc.dart';
import '../widgets/preview_news.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.controller,
  });

  final AppinioSwiperController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Z-News',
                style: TextStyle(
                    color: white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        controller.unswipe();
                      },
                      icon: const Icon(
                        Icons.replay_rounded,
                        color: white,
                      )),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          var calendar =
                              context.read<NewsBloc>().state.calendar;
                          var languages = List<String>.from(
                              context.read<NewsBloc>().state.languages);
                          var sources = List<String>.from(
                              context.read<NewsBloc>().state.sources);
                          return StatefulBuilder(builder: (_, setState) {
                            return AlertDialog(
                              actions: [
                                ElevatedButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(color: Colors.grey),
                                    )),
                                ElevatedButton(
                                    onPressed: () {
                                      context.read<NewsBloc>().add(
                                          NewsEvent.applyFilter(
                                              calendar: calendar,
                                              languages: languages,
                                              sources: sources));
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Apply')),
                              ],
                              content: SizedBox(
                                width: double.maxFinite,
                                child: ListView(
                                  children: [
                                    const Text('News in period of last:'),
                                    Wrap(
                                      spacing: 10,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (calendar != Calendar.hour) {
                                              calendar = Calendar.hour;
                                            } else {
                                              calendar = Calendar.none;
                                            }
                                            setState(() {});
                                          },
                                          child: Chip(
                                            label: const Text('an hour'),
                                            avatar: (calendar == Calendar.hour)
                                                ? const Icon(Icons.check_circle)
                                                : null,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            if (calendar != Calendar.day) {
                                              calendar = Calendar.day;
                                            } else {
                                              calendar = Calendar.none;
                                            }
                                            setState(() {});
                                          },
                                          child: Chip(
                                            label: const Text('24 hours'),
                                            avatar: (calendar == Calendar.day)
                                                ? const Icon(Icons.check_circle)
                                                : null,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            if (calendar != Calendar.day7) {
                                              calendar = Calendar.day7;
                                            } else {
                                              calendar = Calendar.none;
                                            }
                                            setState(() {});
                                          },
                                          child: Chip(
                                              label: const Text('7 days'),
                                              avatar:
                                                  (calendar == Calendar.day7)
                                                      ? const Icon(
                                                          Icons.check_circle)
                                                      : null),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            if (calendar != Calendar.day30) {
                                              calendar = Calendar.day30;
                                            } else {
                                              calendar = Calendar.none;
                                            }
                                            setState(() {});
                                          },
                                          child: Chip(
                                              label: const Text('30 days'),
                                              avatar:
                                                  (calendar == Calendar.day30)
                                                      ? const Icon(
                                                          Icons.check_circle)
                                                      : null),
                                        ),
                                      ],
                                    ),
                                    const Text('News in languages only:'),
                                    Wrap(
                                      spacing: 10,
                                      children: allLanguages
                                          .map(
                                            (lang) => GestureDetector(
                                              onTap: () {
                                                if (languages.contains(lang)) {
                                                  languages.removeWhere(
                                                      (element) =>
                                                          element == lang);
                                                } else {
                                                  languages += [lang];
                                                }
                                                setState(() {});
                                              },
                                              child: Chip(
                                                label: Text(lang),
                                                avatar:
                                                    (languages.contains(lang))
                                                        ? const Icon(
                                                            Icons.check_circle)
                                                        : null,
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                    const Text('Show News from sources:'),
                                    Wrap(
                                      spacing: 10,
                                      children: allSources
                                          .map(
                                            (element) => GestureDetector(
                                              onTap: () {
                                                if (sources.contains(element)) {
                                                  sources.remove(element);
                                                } else {
                                                  sources += [element];
                                                }
                                                setState(() {});
                                              },
                                              child: Chip(
                                                label: Text(element),
                                                avatar:
                                                    (sources.contains(element))
                                                        ? const Icon(
                                                            Icons.check_circle)
                                                        : null,
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.sort,
                      color: white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: TabBar(
              onTap: (value) {
                if (value != context.read<NewsBloc>().state.topicIndex) {
                  context.read<NewsBloc>().add(NewsEvent.changeTopic(value));
                }
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
                Text('Sport'),
                Text('Finance'),
              ]),
        ),
        BlocBuilder<SavedNewsBloc, SavedNewsState>(
          buildWhen: (previous, current) => previous.models != current.models,
          builder: (context, state) {
            return BlocBuilder<NewsBloc, NewsState>(
              buildWhen: (previous, current) =>
                  (previous.status != current.status),
              builder: (context, state) {
                if (state.status == FormzStatus.submissionSuccess) {
                  final data = state.models;
                  return Expanded(
                    child: WAppinioSwiper(
                      currentIndex: context.read<NewsBloc>().state.currentIndex,
                      unlimitedUnswipe: true,
                      onEnd: () {
                        context.read<NewsBloc>().add(const NewsEvent.getNews());
                      },
                      duration: const Duration(milliseconds: 300),
                      controller: controller,
                      padding: const EdgeInsets.all(20),
                      cardsBuilder: (context, index) {
                        return WPreviewNews(model: data[index]);
                      },
                      cardsCount: data.length,
                      pageSavableBloc: context.read<NewsBloc>(),
                    ),
                  );
                } else if (state.status == FormzStatus.submissionInProgress) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return RefreshIndicator(
                    onRefresh: () async =>
                        context.read<NewsBloc>().add(const NewsEvent.getNews()),
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height - 173,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          state.errorMessage,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: white),
                        ),
                      ),
                    ),
                  );
                }
              },
            );
          },
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}
