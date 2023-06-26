import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../assets/colors.dart';
import '../../../../core/app_functions.dart';
import '../../../saved_news/presentation/bloc/saved_news_bloc.dart';
import '../../data/models/news.dart';
import '../pages/inside_news_page.dart';

class WPreviewNews extends StatelessWidget {
  const WPreviewNews({super.key, required this.model});
  final NewsModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => InsideNewsPage(model: model),
                ));
          },
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  height: double.infinity,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    fadeInDuration: const Duration(milliseconds: 300),
                    errorWidget: (context, url, error) => const SizedBox(),
                    imageUrl: model.media ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.transparent, black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.1, 1],
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title,
                      style: const TextStyle(
                          fontSize: 24,
                          color: white,
                          fontWeight: FontWeight.w600),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      AppFunctions.dateToPeriod(model.publishedDate),
                      style: const TextStyle(color: white),
                    ),
                    Text(
                      model.author,
                      style: const TextStyle(color: white),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      model.excerpt ?? '',
                      style: const TextStyle(color: white),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {
                  context
                      .read<SavedNewsBloc>()
                      .add(SavedNewsEvent.addOrRemove(model));
                },
                icon: context.read<SavedNewsBloc>().state.models.contains(model)
                    ? const Icon(
                        Icons.bookmark,
                        color: white,
                      )
                    : const Icon(Icons.bookmark_outline_rounded, color: white)),
            IconButton(
                onPressed: () {
                  //TODO:
                },
                icon: const Icon(Icons.share, color: white))
          ],
        )
      ],
    );
  }
}
