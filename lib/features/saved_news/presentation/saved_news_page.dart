import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widgets/appino_swiper/appino_swiper.dart';
import '../../home/presentation/widgets/preview_news.dart';

import '../../../assets/colors.dart';
import 'bloc/bloc/saved_news_bloc.dart';

class SavedNewsPage extends StatelessWidget {
  const SavedNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Saved News',
                style: TextStyle(
                    color: white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            BlocBuilder<SavedNewsBloc, SavedNewsState>(
              builder: (context, state) {
                if (state.models.isNotEmpty) {
                  return Expanded(
                    child: WAppinioSwiper(
                      currentIndex: state.currentPage,
                      cardsBuilder: (context, index) =>
                          WPreviewNews(model: state.models[index]),
                      cardsCount: state.models.length,
                      pageSavableBloc: context.read<SavedNewsBloc>(),
                    ),
                  );
                }
                return const Center(
                    child: Text(
                  'No saved news found',
                  style: TextStyle(color: white, fontSize: 16),
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
