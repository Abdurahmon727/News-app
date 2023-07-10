import 'package:flutter/material.dart';

import 'new_tile_shimmer.dart';

class ListOfNewsTileShimmer extends StatelessWidget {
  const ListOfNewsTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) => const NewsTileShimmer(),
        separatorBuilder: (_, __) => const Divider(height: 0),
      ),
    );
  }
}
