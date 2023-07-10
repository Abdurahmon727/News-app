import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/shimmer_container.dart';

class PreviewNewsShimmer extends StatelessWidget {
  const PreviewNewsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: const ShimmerContainer(
          height: double.maxFinite,
          width: double.maxFinite,
        ));
  }
}
