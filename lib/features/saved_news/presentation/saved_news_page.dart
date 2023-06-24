import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../assets/colors.dart';
import '../../../core/widgets/w_scale.dart';
import 'bloc/saved_news_bloc.dart';

class SavedNewsPage extends StatelessWidget {
  const SavedNewsPage({super.key});

  final PageStorageKey scrollPositionKey =
      const PageStorageKey('saved news scroll positon');

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: scrollPositionKey,
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  WScaleAnimation(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    child: const Text(
                      'Saved News',
                      style: TextStyle(
                          color: white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
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
                                        context
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
          ),
        ),
        BlocBuilder<SavedNewsBloc, SavedNewsState>(
          builder: (context, state) {
            if (state.models.isNotEmpty) {
              return SliverList.separated(
                itemCount: state.models.length,
                itemBuilder: (context, index) {
                  final model = state.models[state.models.length - 1 - index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
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
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )),
                              Row(
                                children: [
                                  Text(
                                    '${model.rights} \u{25CB} ${model.topic}',
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ]),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              );
            }
            return const Center(
              child: Text(
                'No saved news found',
                style: TextStyle(color: white, fontSize: 16),
              ),
            );
          },
        ),
      ],
    );
  }
}
