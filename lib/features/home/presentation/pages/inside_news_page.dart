import 'package:flutter/material.dart';
import '../../../../core/app_functions.dart';
import '../../data/models/news.dart';

class InsideNewsPage extends StatefulWidget {
  const InsideNewsPage({super.key, required this.model});
  final NewsModel model;

  @override
  State<InsideNewsPage> createState() => _InsideNewsPageState();
}

class _InsideNewsPageState extends State<InsideNewsPage>
    with SingleTickerProviderStateMixin {
  late TransformationController transformationController;
  late AnimationController animationController;
  Animation<Matrix4>? animation;
  @override
  void initState() {
    transformationController = TransformationController();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() {
        transformationController.value = animation!.value;
      });
    super.initState();
  }

  @override
  void dispose() {
    transformationController.dispose();
    animationController.dispose();
    super.dispose();
  }

  void resetAnimation() {
    animation = Matrix4Tween(
            begin: transformationController.value, end: Matrix4.identity())
        .animate(CurvedAnimation(
            parent: animationController, curve: Curves.elasticOut));
    animationController.forward(from: 0);
  }

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
                  icon: Icon(Icons.navigate_before)),
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
                InteractiveViewer(
                  transformationController: transformationController,
                  clipBehavior: Clip.none,
                  panEnabled: false,
                  minScale: 1,
                  maxScale: 5,
                  onInteractionEnd: (details) {
                    resetAnimation();
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(widget.model.media!)),
                ),
              Text(widget.model.summery ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}
