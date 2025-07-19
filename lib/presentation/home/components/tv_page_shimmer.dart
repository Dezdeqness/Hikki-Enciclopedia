import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/core/ui/shimmer.dart';

class TvPageShimmer extends StatelessWidget {
  const TvPageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerHost(
      linearGradient: kShimmerGradient,
      child: ShimmerView(child: _movieShimmerShape()),
    );
  }

  Widget _movieShimmerShape() => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
        ),
        child: SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
      );
}
