import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/assets/colors.dart';
import 'package:news_app/core/widgets/w_scale.dart';

import '../../../../core/widgets/w_interactive_viewer.dart';
import '../../../saved_news/presentation/bloc/saved_news_bloc.dart';
import '../../data/models/news.dart';

class InsideNewsPage extends StatelessWidget {
  const InsideNewsPage({super.key, required this.model});
  final NewsModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        WScaleAnimation(
          onTap: () {},
          child: FloatingActionButton(
            heroTag: 'hero1',
            splashColor: Colors.transparent,
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {
              context
                  .read<SavedNewsBloc>()
                  .add(SavedNewsEvent.addOrRemove(model));
            },
            child: BlocBuilder<SavedNewsBloc, SavedNewsState>(
              builder: (context, state) {
                return Icon(
                  (state.models.contains(model))
                      ? Icons.bookmark_rounded
                      : Icons.bookmark_border_rounded,
                  color: white,
                  size: 30,
                );
              },
            ),
          ),
        ),
        const SizedBox(width: 10),
        WScaleAnimation(
          onTap: () {},
          child: FloatingActionButton(
            heroTag: 'hero2',
            splashColor: Colors.transparent,
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {},
            child: const Icon(
              Icons.share,
              color: white,
              size: 30,
            ),
          ),
        ),
      ]),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),
        children: [
          Row(children: [
            WScaleAnimation(
              onTap: () => Navigator.pop(context),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Icon(Icons.arrow_back_ios_new),
              ),
            ),
          ]),
          Text(
            model.title,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          if (model.author.isNotEmpty)
            Align(
              alignment: Alignment.topRight,
              child: Text(
                'By ${model.author}',
              ),
            ),
          Text(model.excerpt ?? ''),
          if (model.media != null)
            WInteractiveViewer(
              borderRadius: BorderRadius.circular(15),
              imageUrl: model.media!,
            ),
          Text(model.summary ?? ''),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
