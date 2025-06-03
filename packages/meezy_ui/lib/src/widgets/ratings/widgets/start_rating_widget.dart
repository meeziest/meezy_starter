import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarRating extends StatelessWidget {
  final bool active;
  final int itemCount;
  final int initialRating;
  final int minRating;
  final double itemSize;
  final void Function(double rating)? onTap;

  const StarRating({
    super.key,
    this.active = true,
    this.itemCount = 5,
    this.initialRating = 1,
    this.minRating = 1,
    this.itemSize = 25,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initialRating.toDouble(),
      itemSize: itemSize,
      minRating: minRating.toDouble(),
      ignoreGestures: !active,
      itemCount: itemCount,
      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
      itemBuilder: (context, index) => const Icon(Icons.star),
      onRatingUpdate: (rating) {
        onTap?.call(rating);
      },
    );
  }
}
