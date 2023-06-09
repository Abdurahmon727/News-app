import 'package:flutter/material.dart';
import 'package:news_app/assets/colors.dart';

class WPreviewNews extends StatelessWidget {
  const WPreviewNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://cdn.modernghana.com/images/content/692023123522-nsjum8x432-screenshot-2023-06-08-134450.png',
            )),
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
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 15),
          Text(
            'a minute ago',
            style: TextStyle(color: Colors.grey),
          ),
          Text('BBC NEWS'),
          SizedBox(height: 15),
          Text(
              "Tijorat banklari 9-iyun kuni aholidan 1 AQSh dollarini 11 380−11 430 so‘mdan sotib olmoqda, sotuv kursi esa 11 440−11 490 so‘m"),
        ],
      ),
    );
  }
}
