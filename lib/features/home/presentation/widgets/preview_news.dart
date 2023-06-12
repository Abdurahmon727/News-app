import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/assets/colors.dart';
import 'package:news_app/core/app_functions.dart';
import 'package:news_app/features/home/data/models/news.dart';
import 'package:news_app/features/home/presentation/pages/inside_news_page.dart';

class WPreviewNews extends StatelessWidget {
  const WPreviewNews({super.key, required this.model});
  final NewsModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => InsideNewsPage(model: model),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppFunctions.randomColor(model.title.length),
          image: model.media != null
              ? DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(model.media!),
                )
              : null,
          boxShadow: const [
            BoxShadow(
              offset: Offset(1, 1),
              color: black,
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              colors: [Colors.transparent, black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 1],
            ),
          ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
