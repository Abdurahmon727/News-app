import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../assets/colors.dart';
import '../../../../core/app_functions.dart';
import '../../data/models/news.dart';
import '../pages/inside_news_page.dart';

class WPreviewNews extends StatelessWidget {
  const WPreviewNews({super.key, required this.model});
  final NewsModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                color: AppFunctions.randomColor(model.title.length),
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
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: const TextStyle(fontSize: 24, color: white),
                ),
                const SizedBox(height: 5),
                Text(
                  model.publishedDate ?? '',
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
    );
  }
}
