import 'package:flutter/material.dart';

class FadeImageAnimation extends StatefulWidget {
  final String imageUrl;

  FadeImageAnimation({required this.imageUrl});

  @override
  _FadeImageAnimationState createState() => _FadeImageAnimationState();
}

class _FadeImageAnimationState extends State<FadeImageAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: FadeInImage.assetNetwork(
        placeholder:
            'assets/placeholder.png', // Replace with your own placeholder image asset
        image: widget.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
