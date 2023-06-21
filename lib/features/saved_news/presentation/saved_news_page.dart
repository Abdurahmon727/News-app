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
  Widget build(BuildContext context) {
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
                  IconButton(
                    onPressed: () {
                      //TODO
                    },
                    icon: const Icon(
                      Icons.more_vert,
                      color: white,
                    ),
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
