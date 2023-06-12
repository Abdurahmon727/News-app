import 'package:flutter/material.dart';

class WInteractiveViewer extends StatefulWidget {
  const WInteractiveViewer({
    super.key,
    required this.imageUrl,
    required this.borderRadius,
  });

  final String imageUrl;
  final BorderRadius borderRadius;

  @override
  State<WInteractiveViewer> createState() => _WInteractiveViewerState();
}

class _WInteractiveViewerState extends State<WInteractiveViewer>
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
    return InteractiveViewer(
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
        child: Image.network(
          widget.imageUrl,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
