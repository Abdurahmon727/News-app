import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../assets/colors.dart';
import '../../../core/widgets/w_scale.dart';
import '../../home/presentation/pages/inside_news_page.dart';
import 'bloc/saved_news_bloc.dart';

class SavedNewsPage extends StatelessWidget {
  const SavedNewsPage({super.key});

  final PageStorageKey scrollPositionKey =
      const PageStorageKey('saved news scroll positon');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        key: scrollPositionKey,
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).primaryColor,
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
                      child: const Text('Saved News'),
                    ),
                    const Spacer(),
                    PopupMenuButton(
                      child: const Icon(
                        Icons.more_vert,
                        color: white,
                      ),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          onTap: () {
                            Future.delayed(
                              Duration.zero,
                              () => showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    actionsPadding: const EdgeInsets.only(
                                      bottom: 10,
                                      right: 10,
                                    ),
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
                                          context.read<SavedNewsBloc>().add(
                                              const SavedNewsEvent.clear());
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
                  itemCount: state.models.length + 1,
                  itemBuilder: (context, index) {
                    if (index >= state.models.length) {
                      return const SizedBox(height: 80);
                    }

                    final model = state.models[state.models.length - 1 - index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) =>
                                  InsideNewsPage(model: model),
                            )),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Text(
                                    state.models[index].title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '${model.rights} \u{25CB} ${model.topic}',
                                          maxLines: 1,
                                          style: const TextStyle(
                                              color: Colors.grey),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                );
              }
              return const SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    'No saved news found',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
