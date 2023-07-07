import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/w_scale.dart';

class WViewOption extends StatelessWidget {
  const WViewOption({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });
  final bool isSelected;
  final String title;
  final Icon icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: onTap,
      child: Container(
        height: 150,
        width: (MediaQuery.sizeOf(context).width - 42) / 2,
        decoration: BoxDecoration(
          border: Border.all(
              width: isSelected ? 2 : 0.5,
              color: isSelected ? Theme.of(context).primaryColor : Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
