import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/app_functions.dart';

import '../../../../assets/colors.dart';
import '../../../home/data/models/news.dart';
import '../../../home/presentation/pages/inside_news_page.dart';
import '../bloc/saved_news_bloc.dart';

class SavedNewsTile extends StatelessWidget {
  const SavedNewsTile({
    super.key,
    required this.model,
  });

  final NewsModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => InsideNewsPage(model: model),
        ),
      ),
      child: Dismissible(
        direction: DismissDirection.endToStart,
        key: ValueKey(model.title),
        background: Container(
          alignment: Alignment.centerRight,
          color: Colors.red,
          child: const Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.delete_rounded,
              color: white,
            ),
          ),
        ),
        onDismissed: (direction) => context
            .read<SavedNewsBloc>()
            .add(SavedNewsEvent.addOrRemove(model)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
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
                      model.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        AppFunctions.dateToPeriod(model.publishedDate),
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${model.rights} \u{25CB} ${model.topic}',
                            maxLines: 1,
                            style: const TextStyle(color: Colors.grey),
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
      ),
    );
  }
}
