// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class MusicVisualizer extends StatelessWidget {
  final Color color;
  final List<int>? duration;
  final int? barCount;
  final double distance;
  final Curve? curve;

  const MusicVisualizer({
    Key? key,
    required this.color,
    required this.duration,
    required this.barCount,
    this.curve = Curves.easeInQuad,
    this.distance = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List<Widget>.generate(
        barCount!,
        (index) => VisualComponent(
          curve: curve!,
          duration: duration![index],
          color: color,
          distance: distance,
        ),
      ),
    );
  }
}

class VisualComponent extends StatefulWidget {
  final int? duration;
  final Color? color;
  final Curve? curve;
  final double distance;

  const VisualComponent(
      {Key? key,
      @required this.duration,
      @required this.color,
      @required this.curve,
      required this.distance})
      : super(key: key);

  @override
  _VisualComponentState createState() => _VisualComponentState();
}

class _VisualComponentState extends State<VisualComponent>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animate();
  }

  @override
  void dispose() {
    animation!.removeListener(() {});
    animation!.removeStatusListener((status) {});
    animationController!.stop();
    animationController!.reset();
    animationController!.dispose();
    super.dispose();
  }

  void animate() {
    animationController = AnimationController(
        duration: Duration(milliseconds: widget.duration!), vsync: this);
    final curvedAnimation =
        CurvedAnimation(parent: animationController!, curve: widget.curve!);
    animation = Tween<double>(begin: 0, end: 50).animate(curvedAnimation)
      ..addListener(() {
        update();
      });
    animationController!.repeat(reverse: true);
  }

  void update() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: widget.distance / 2),
      width: 4,
      height: animation!.value,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }
}
