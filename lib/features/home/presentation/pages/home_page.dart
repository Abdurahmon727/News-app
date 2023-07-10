import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/assets/constants.dart';
import 'package:news_app/core/app_functions.dart';
import 'package:news_app/features/home/presentation/widgets/list_of_news_tile_shimmer.dart';
import 'package:news_app/features/home/presentation/widgets/preview_news_shimmer.dart';

import '../../../../assets/colors.dart';
import '../../../../core/bloc/theme/theme_bloc.dart';
import '../../../../core/data/extensions.dart';
import '../../../../core/models/formz/formz_status.dart';
import '../../../../core/models/home_datas.dart';
import '../../../../core/widgets/appino_swiper/appino_swiper.dart';
import '../../../../core/widgets/pagination_loader.dart';
import '../../../../core/widgets/w_scale.dart';

import '../bloc/news_bloc.dart';
import '../widgets/preview_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageStorageKey<String> scrollPositionKey =
      const PageStorageKey('home_position_key');

  final AppinioSwiperController controller = AppinioSwiperController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WScaleAnimation(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: const Text(
                    'Z-News',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    if (context.watch<ThemeBloc>().state.isCardView)
                      IconButton(
                          onPressed: () {
                            controller.unswipe();
                          },
                          icon: const Icon(
                            Icons.replay_rounded,
                          )),
                    IconButton(
                      onPressed: () {
                        showSortDialog(context);
                      },
                      icon: const Icon(
                        Icons.sort,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: DefaultTabController(
              length: context.read<NewsBloc>().state.topics.length,
              initialIndex: context.read<NewsBloc>().state.topicIndex,
              child: TabBar(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width / 2 - 50),
                onTap: (value) {
                  scrollPositionKey = AppFunctions.getNewUniquePageStorageKey();
                  if (value != context.read<NewsBloc>().state.topicIndex) {
                    context.read<NewsBloc>().add(NewsEvent.changeTopic(value));
                  }
                },
                dividerColor: Colors.transparent,
                indicator: const BoxDecoration(),
                unselectedLabelStyle: const TextStyle(fontSize: 16),
                labelColor: Theme.of(context).indicatorColor,
                isScrollable: true,
                labelStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                labelPadding: const EdgeInsets.all(8),
                tabs: context
                    .read<NewsBloc>()
                    .state
                    .topics
                    .map((e) => Text(e.inCaps))
                    .toList(),
              ),
            ),
          ),
          BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              final isCardView = context.read<ThemeBloc>().state.isCardView;
              if (state.status == FormzStatus.pure) {
                context.read<NewsBloc>().add(const NewsEvent.getNews());
                return const SizedBox();
              }
              if (state.status == FormzStatus.submissionSuccess) {
                final data = state.models;
                if (isCardView) {
                  return Expanded(
                    child: WAppinioSwiper(
                      currentIndex: state.currentIndex,
                      unlimitedUnswipe: true,
                      onEnd: () => context
                          .read<NewsBloc>()
                          .add(const NewsEvent.getNews()),
                      duration: const Duration(milliseconds: 300),
                      controller: controller,
                      padding: const EdgeInsets.only(
                          bottom: 60, left: 20, right: 20, top: 10),
                      cardsBuilder: (_, index) {
                        return WPreviewNews(model: data[index]);
                      },
                      cardsCount: data.length,
                      pageSavableBloc: context.read<NewsBloc>(),
                    ),
                  );
                } else {
                  return PaginationListView(
                    scrollPositionKey: scrollPositionKey,
                    isFailedToLoadMore: state.isFailedToLoadMore,
                    models: state.models,
                    onLoadMore: () => context
                        .read<NewsBloc>()
                        .add(const NewsEvent.loadPagination()),
                  );
                }
              } else if (state.status == FormzStatus.submissionInProgress) {
                if (isCardView) {
                  return const Expanded(
                      child: PreviewNewsShimmer(
                    padding: EdgeInsets.only(
                        bottom: 60, left: 20, right: 20, top: 10),
                  ));
                } else {
                  return const ListOfNewsTileShimmer();
                }
              } else {
                return RefreshIndicator(
                  color: themePrimaryColors[
                      context.read<ThemeBloc>().state.primaryColorIndex],
                  onRefresh: () async =>
                      context.read<NewsBloc>().add(const NewsEvent.getNews()),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height - 173,
                      width: MediaQuery.sizeOf(context).width,
                      child: Text(
                        state.errorMessage,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Future<dynamic> showSortDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) {
        var calendar = context.read<NewsBloc>().state.calendar;
        var languages =
            List<String>.from(context.read<NewsBloc>().state.languages);
        var sources = List<String>.from(context.read<NewsBloc>().state.sources);
        return StatefulBuilder(builder: (_, setState) {
          return AlertDialog(
            backgroundColor: white,
            actions: [
              ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.grey),
                  )),
              ElevatedButton(
                onPressed: () {
                  scrollPositionKey = AppFunctions.getNewUniquePageStorageKey();
                  context.read<NewsBloc>().add(NewsEvent.applyFilter(
                      calendar: calendar,
                      languages: languages,
                      sources: sources));
                  Navigator.pop(context);
                },
                child: Text(
                  'Apply',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ],
            content: SizedBox(
              width: double.maxFinite,
              child: ListView(
                shrinkWrap: true,
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
                            avatar: (calendar == Calendar.day7)
                                ? const Icon(Icons.check_circle)
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
                            avatar: (calendar == Calendar.day30)
                                ? const Icon(Icons.check_circle)
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
                                languages
                                    .removeWhere((element) => element == lang);
                              } else {
                                languages += [lang];
                              }
                              setState(() {});
                            },
                            child: Chip(
                              label: Text(lang),
                              avatar: (languages.contains(lang))
                                  ? const Icon(Icons.check_circle)
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
                              avatar: (sources.contains(element))
                                  ? const Icon(Icons.check_circle)
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
  }
}
