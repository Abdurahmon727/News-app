import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/shimmer_container.dart';

class NewsTileShimmer extends StatelessWidget {
  const NewsTileShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: SizedBox(
        height: 80,
        width: double.maxFinite,
        child: Row(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: const ShimmerContainer(
                height: 80,
                width: 80,
              )),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerContainer(width: double.maxFinite, height: 32),
                Spacer(),
                ShimmerContainer(width: 200, height: 20)
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
