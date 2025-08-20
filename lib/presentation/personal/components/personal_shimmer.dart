import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/core/ui/shimmer.dart';

class PersonalShimmer extends StatelessWidget {
  final int placeholderCount;

  const PersonalShimmer({super.key, this.placeholderCount = 6});

  @override
  Widget build(BuildContext context) {
    return ShimmerHost(
      linearGradient: kShimmerGradient,
      child: placeholderCount != 1
          ? ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: placeholderCount,
        itemBuilder: (BuildContext context, int index) {
          return ShimmerView(child: _movieShimmerShape());
        },
      )
          : ShimmerView(child: _movieShimmerShape()),
    );
  }

  Widget _movieShimmerShape() => Container(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 120,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 18,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 24,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 24,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 18,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            )),
      ],
    ),
  );
}
