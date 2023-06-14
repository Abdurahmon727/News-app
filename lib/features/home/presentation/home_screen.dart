import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/models/home_tabbars.dart';

import '../../../assets/colors.dart';
import '../../../core/models/formz/formz_status.dart';
import 'bloc/news_bloc.dart';
import 'widgets/preview_news.dart';

enum Calendar { hour, day, day7, day30 }

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
  // var currentCalendar = Calendar.hour;

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
                        showDialog(
                          context: context,
                          builder: (_) {
                            return const AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SingleChoice(),
                                  //           const Text('News\' which are published at'),
                                  //           SegmentedButton<Calendar>(
                                  //               emptySelectionAllowed: true,
                                  //               showSelectedIcon: true,
                                  //               segments: const <ButtonSegment<Calendar>>[
                                  //                 ButtonSegment<Calendar>(
                                  //                   value: Calendar.hour,
                                  //                   label: Text('an hour'),
                                  //                 ),
                                  //                 ButtonSegment<Calendar>(
                                  //                   value: Calendar.day,
                                  //                   label: Text('a day'),
                                  //                 ),
                                  //                 ButtonSegment<Calendar>(
                                  //                   value: Calendar.day7,
                                  //                   label: Text('7 days'),
                                  //                 ),
                                  //                 ButtonSegment<Calendar>(
                                  //                   value: Calendar.day30,
                                  //                   label: Text('30 days'),
                                  //                 ),
                                  //               ],
                                  //               selected: <Calendar>{currentCalendar},
                                  //               onSelectionChanged:
                                  //                   (Set<Calendar> newSelection) {
                                  //                 setState(() {
                                  //                   currentCalendar = newSelection.first;
                                  //                 });
                                  //                 print(currentCalendar);
                                  // }),
                                ],
                              ),
                            );
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
                      if (value != context.read<NewsBloc>().state.tabIndex) {
                        print(value);
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

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Calendar calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
          value: Calendar.hour,
          label: Text('an hour'),
        ),
        ButtonSegment<Calendar>(
          value: Calendar.day,
          label: Text('24 hours'),
        ),
        ButtonSegment<Calendar>(
          value: Calendar.day7,
          label: Text('7 days'),
        ),
        ButtonSegment<Calendar>(
          value: Calendar.day30,
          label: Text('30 days'),
        ),
      ],
      selected: <Calendar>{calendarView},
      onSelectionChanged: (Set<Calendar> newSelection) {
        setState(() {
          // By default there is only a single segment that can be
          // selected at one time, so its value is always the first
          // item in the selected set.
          calendarView = newSelection.first;
        });
      },
    );
  }
}
