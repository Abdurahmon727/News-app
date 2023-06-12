import 'package:flutter/material.dart';
import '../../../../core/app_functions.dart';
import '../../../../core/widgets/w_interactive_viewer.dart';
import '../../data/models/news.dart';

class InsideNewsPage extends StatefulWidget {
  const InsideNewsPage({super.key, required this.model});
  final NewsModel model;

  @override
  State<InsideNewsPage> createState() => _InsideNewsPageState();
}

class _InsideNewsPageState extends State<InsideNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppFunctions.randomColor(widget.model.title.length),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.navigate_before)),
              Text(widget.model.title),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'By ${widget.model.author}',
                  textAlign: TextAlign.end,
                ),
              ),
              Text(widget.model.excerpt ?? ''),
              if (widget.model.media != null)
                WInteractiveViewer(
                  borderRadius: BorderRadius.circular(15),
                  imageUrl: widget.model.media!,
                ),
              Text(widget.model.summery ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}
