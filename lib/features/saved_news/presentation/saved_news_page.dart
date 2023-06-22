import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../assets/colors.dart';
import '../../../core/widgets/appino_swiper/appino_swiper.dart';
import '../../home/presentation/widgets/preview_news.dart';
import 'bloc/saved_news_bloc.dart';

class SavedNewsPage extends StatelessWidget {
  const SavedNewsPage({super.key, required this.swiperController});

  final AppinioSwiperController swiperController;

  @override
  Widget build(BuildContext ctx) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  const Text(
                    'Saved News',
                    style: TextStyle(
                        color: white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => swiperController.unswipe(),
                    icon: const Icon(Icons.replay_rounded, color: white),
                  ),
                  PopupMenuButton(
                    child: const Icon(Icons.more_vert, color: white),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        onTap: () {
                          Future.delayed(
                            Duration.zero,
                            () => showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('No'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        ctx
                                            .read<SavedNewsBloc>()
                                            .add(const SavedNewsEvent.clear());
                                      },
                                      child: const Text('Yes, delete'),
                                    )
                                  ],
                                  content: const Text(
                                      'Are you sure to delete all saved news?'),
                                );
                              },
                            ),
                          );
                        },
                        child: const Text('Delete all'),
                      )
                    ],
                  ),
                ],
              ),
            ),
            BlocBuilder<SavedNewsBloc, SavedNewsState>(
              builder: (context, state) {
                if (state.models.isNotEmpty) {
                  return Expanded(
                    // height: 450,
                    // width: double.maxFinite,
                    child: WAppinioSwiper(
                      loop: true,
                      unlimitedUnswipe: true,
                      controller: swiperController,
                      currentIndex: state.currentPage,
                      cardsBuilder: (context, index) => WPreviewNews(
                          model: state.models[state.models.length - index - 1]),
                      cardsCount: state.models.length,
                      pageSavableBloc: context.read<SavedNewsBloc>(),
                    ),
                  );
                }
                return const Center(
                  child: Text(
                    'No saved news found',
                    style: TextStyle(color: white, fontSize: 16),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
