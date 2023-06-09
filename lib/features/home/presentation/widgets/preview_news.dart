import 'package:flutter/material.dart';
import 'package:news_app/assets/colors.dart';

class WPreviewNews extends StatelessWidget {
  const WPreviewNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: miskyRose,
        boxShadow: const [
          BoxShadow(offset: Offset(1, 1), blurRadius: 10, spreadRadius: 1),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Demand for Indian generatic drugs skysockets in Chine amid Covid surge',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(height: 15),
          Text(
            'a minute ago',
            style: TextStyle(color: Colors.white54),
          ),
        ],
      ),
    );
  }
}
