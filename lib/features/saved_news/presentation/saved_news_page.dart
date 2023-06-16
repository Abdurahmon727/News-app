import 'package:flutter/material.dart';

import '../../../assets/colors.dart';

class SavedNewsPage extends StatelessWidget {
  const SavedNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 50),
        child: Column(
          children: [
            Text(
              'Saved News',
              style: TextStyle(
                  color: white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
