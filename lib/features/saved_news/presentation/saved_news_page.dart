import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../assets/colors.dart';
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
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    shrinkWrap: true,
                    itemCount: state.models.length,
                    itemBuilder: (context, index) {
                      final model = state.models[index];
                      return SizedBox(
                        height: 80,
                        width: double.maxFinite,
                        child: Row(children: [
                          if (model.media != null)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: SizedBox(
                                height: 80,
                                width: 80,
                                child: CachedNetworkImage(
                                  imageUrl: model.media!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                    child: Text(
                                  state.models[index].title,
                                  style: TextStyle(color: white),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )),
                                Row(
                                  children: [
                                    Text(
                                        '${model.rights} \u{25CB} ${model.topic}')
                                  ],
                                )
                              ],
                            ),
                          ),
                        ]),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
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
