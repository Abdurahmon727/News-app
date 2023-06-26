import 'package:flutter/material.dart';

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
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.navigate_before),
            ),
          ),
          Text(
            widget.model.title,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          if (widget.model.author.isNotEmpty)
            Align(
              alignment: Alignment.topRight,
              child: Text(
                'By ${widget.model.author}',
              ),
            ),
          Text(widget.model.excerpt ?? ''),
          if (widget.model.media != null)
            WInteractiveViewer(
              borderRadius: BorderRadius.circular(15),
              imageUrl: widget.model.media!,
            ),
          Text(widget.model.summary ?? ''),
        ],
      ),
    );
  }
}
