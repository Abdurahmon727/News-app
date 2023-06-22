import 'package:flutter/material.dart';

import '../../assets/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: black,
        body: Center(
          child: CircularProgressIndicator.adaptive(),
        ));
  }
}
