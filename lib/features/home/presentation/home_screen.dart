import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/models/home_datas.dart';

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
    super.initState();
  }

  final controller = AppinioSwiperController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: homeTopics.length,
        child: Scaffold(
          backgroundColor: black,
          body: Column(
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
                          color: white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        Calendar calendar =
                            context.read<NewsBloc>().state.calendar;
                        List<String> languages =
                            context.read<NewsBloc>().state.languages;
                        List<String> sources =
                            context.read<NewsBloc>().state.sources;
                        showDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                                builder: (context, setState) {
                              return AlertDialog(
                                actions: [
                                  ElevatedButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(color: Colors.grey),
                                      )),
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: const Text('Apply')),
                                ],
                                content: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    const Text('News in period of last:'),
                                    Wrap(
                                      spacing: 10,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              calendar = Calendar.hour;
                                            });
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
                                            setState(() {
                                              calendar = Calendar.day;
                                            });
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
                                            setState(() {
                                              calendar = Calendar.day7;
                                            });
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
                                            setState(() {
                                              calendar = Calendar.day30;
                                            });
                                          },
                                          child: Chip(
                                              label: const Text('30 days'),
                                              avatar:
                                                  (calendar == Calendar.day30)
                                                      ? const Icon(
                                                          Icons.check_circle)
                                                      : null),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              calendar = Calendar.none;
                                            });
                                          },
                                          child: Chip(
                                              label: const Text('any'),
                                              avatar:
                                                  (calendar == Calendar.none)
                                                      ? const Icon(
                                                          Icons.check_circle)
                                                      : null),
                                        ),
                                      ],
                                    ),
                                    const Text('News in languages:'),
                                    Wrap(
                                      spacing: 10,
                                      children: allLanguages
                                          .map(
                                            (lang) => GestureDetector(
                                              onTap: () {
                                                if (languages.contains(lang)) {
                                                  languages.remove(lang);
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
                                      // children: [
                                      //   GestureDetector(
                                      //     onTap: () {
                                      //       if (languages.contains('element')) {
                                      //         languages.remove('element');
                                      //       } else {
                                      //         languages.add('element');
                                      //       }

                                      //       setState(() {});
                                      //     },
                                      //     child: Chip(
                                      //       label: const Text('an hour'),
                                      //       avatar: (languages
                                      //               .contains('element'))
                                      //           ? const Icon(Icons.check_circle)
                                      //           : null,
                                      //     ),
                                      //   ),
                                      //   GestureDetector(
                                      //     onTap: () {
                                      //       setState(() {
                                      //         calendar = Calendar.day;
                                      //       });
                                      //     },
                                      //     child: Chip(
                                      //       label: const Text('24 hours'),
                                      //       avatar: (calendar == Calendar.day)
                                      //           ? const Icon(Icons.check_circle)
                                      //           : null,
                                      //     ),
                                      //   ),
                                      //   GestureDetector(
                                      //     onTap: () {
                                      //       setState(() {
                                      //         calendar = Calendar.day7;
                                      //       });
                                      //     },
                                      //     child: Chip(
                                      //         label: const Text('7 days'),
                                      //         avatar:
                                      //             (calendar == Calendar.day7)
                                      //                 ? const Icon(
                                      //                     Icons.check_circle)
                                      //                 : null),
                                      //   ),
                                      //   GestureDetector(
                                      //     onTap: () {
                                      //       setState(() {
                                      //         calendar = Calendar.day30;
                                      //       });
                                      //     },
                                      //     child: Chip(
                                      //         label: const Text('30 days'),
                                      //         avatar:
                                      //             (calendar == Calendar.day30)
                                      //                 ? const Icon(
                                      //                     Icons.check_circle)
                                      //                 : null),
                                      //   ),
                                      // ],
                                    ),
                                  ],
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
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: TabBar(
                    onTap: (value) {
                      if (value != context.read<NewsBloc>().state.topicIndex) {
                        context
                            .read<NewsBloc>()
                            .add(NewsEvent.changeTopic(value));
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
                  } else if (state.status == FormzStatus.submissionInProgress) {
                    return const Center(child: CircularProgressIndicator());
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
    );
  }
}
