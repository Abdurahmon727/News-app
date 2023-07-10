import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../features/home/data/models/news.dart';
import '../../features/home/presentation/widgets/news_tile.dart';

class PaginationListView extends StatelessWidget {
  const PaginationListView({
    super.key,
    this.scrollPositionKey,
    required this.models,
    required this.onLoadMore,
    required this.isFailedToLoadMore,
  });

  final List<NewsModel> models;
  final VoidCallback onLoadMore;
  final bool isFailedToLoadMore;
  final PageStorageKey<String>? scrollPositionKey;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        key: scrollPositionKey,
        itemCount: models.length + 1,
        itemBuilder: (context, index) {
          if (index == models.length) {
            return VisibilityDetector(
              onVisibilityChanged: (visibilityInfo) {
                final visibilityPercentage =
                    visibilityInfo.visibleFraction * 100;
                if (visibilityPercentage == 100) {
                  print('onLoadMore');
                  onLoadMore();
                }
              },
              key: const Key('my-key'),
              child: Container(
                alignment: Alignment.topCenter,
                height: 150,
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: isFailedToLoadMore
                      ? const SizedBox()
                      : CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                ),
              ),
            );
          }

          return NewsTile(model: models[index]);
        },
        separatorBuilder: (_, __) => const Divider(height: 0),
      ),
    );
  }
}
