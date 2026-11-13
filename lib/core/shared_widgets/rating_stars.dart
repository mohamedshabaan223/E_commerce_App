import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({
    super.key,
    required this.rating,
    this.starSize,
    this.spacing,
    this.color,
    this.onRatingChanged,
  });

  final double rating;
  final double? starSize;
  final double? spacing;
  final Color? color;
  final ValueChanged<int>? onRatingChanged;

  @override
  Widget build(BuildContext context) {
    final effectiveSize = starSize ?? 14.r;
    final effectiveColor = color ?? context.appColors.primaryColor;
    final effectiveSpacing = spacing ?? 2.w;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final isFilled = index < rating.round();
        final star = Icon(
          isFilled ? Icons.star : Icons.star_border,
          size: effectiveSize,
          color: effectiveColor,
        );

        if (onRatingChanged != null) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: effectiveSpacing / 2),
            child: GestureDetector(
              onTap: () => onRatingChanged!(index + 1),
              behavior: HitTestBehavior.opaque,
              child: star,
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.only(right: index < 4 ? effectiveSpacing : 0),
          child: star,
        );
      }),
    );
  }
}
