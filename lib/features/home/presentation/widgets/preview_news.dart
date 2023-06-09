import 'package:flutter/material.dart';
import 'package:news_app/assets/colors.dart';

class WPreviewNews extends StatelessWidget {
  const WPreviewNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            'https://cdn.modernghana.com/images/content/692023123522-nsjum8x432-screenshot-2023-06-08-134450.png',
          ),
        ),
        boxShadow: const [
          BoxShadow(
            offset: Offset(1, 1),
            color: black,
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [Colors.transparent, black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5, 1],
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Demand for Indian generatic drugs skysockets in Chine amid Covid surge',
              style: TextStyle(fontSize: 24, color: white),
            ),
            SizedBox(height: 15),
            Text(
              'a minute ago',
              style: TextStyle(color: white),
            ),
            Text(
              'BBC NEWS',
              style: TextStyle(color: white),
            ),
            SizedBox(height: 15),
            Text(
              "Tijorat banklari 9-iyun kuni aholidan 1 AQSh dollarini 11 380−11 430 so‘mdan sotib olmoqda, sotuv kursi esa 11 440−11 490 so‘m",
              style: TextStyle(color: white),
            ),
          ],
        ),
      ),
    );
  }
}
