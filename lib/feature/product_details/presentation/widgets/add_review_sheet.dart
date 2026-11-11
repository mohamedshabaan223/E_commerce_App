// feature/product_details/presentation/widgets/add_review_sheet.dart
import 'package:ecommerce_app/core/shared_widgets/rating_stars.dart';
import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddReviewSheet extends StatefulWidget {
  const AddReviewSheet({
    super.key,
    this.onClose,
    this.onSubmit,
    this.isLoading = false,
  });

  final VoidCallback? onClose;
  final void Function(int rating, String comment)? onSubmit;
  final bool isLoading;

  @override
  State<AddReviewSheet> createState() => _AddReviewSheetState();
}

class _AddReviewSheetState extends State<AddReviewSheet> {
  int _selectedStars = 5;
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        20.w,
        12.h,
        20.w,
        MediaQuery.of(context).viewInsets.bottom + 24.h,
      ),
      decoration: BoxDecoration(
        color: context.appColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: context.appColors.border,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Add Review',
                style: AppStyle.text22Medium.copyWith(
                  color: context.appColors.textPrimary,
                ),
              ),
              GestureDetector(
                onTap: widget.onClose ?? () => Navigator.maybePop(context),
                behavior: HitTestBehavior.opaque,
                child: Container(
                  width: 32.r,
                  height: 32.r,
                  decoration: BoxDecoration(
                    color: context.appColors.surfaceVariant,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.close,
                    color: context.appColors.textSecondary,
                    size: 18.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          RatingStars(
            rating: _selectedStars.toDouble(),
            starSize: 32.r,
            spacing: 8.w,
            onRatingChanged: (value) => setState(() => _selectedStars = value),
          ),
          SizedBox(height: 8.h),
          Text(
            '$_selectedStars OF 5 STARS',
            style: AppStyle.text12Medium.copyWith(
              color: context.appColors.primaryColor,
              letterSpacing: 1.0,
            ),
          ),
          SizedBox(height: 20.h),
          TextField(
            controller: _controller,
            maxLines: 4,
            style: AppStyle.text14Regular.copyWith(
              color: context.appColors.textPrimary,
            ),
            decoration: InputDecoration(
              hintText: 'Write your review (optional)',
              hintStyle: AppStyle.text14Regular.copyWith(
                color: context.appColors.textSecondary,
              ),
              filled: true,
              fillColor: context.appColors.backgroundColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.all(14.r),
            ),
          ),
          SizedBox(height: 20.h),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: widget.isLoading
                  ? null
                  : () {
                      widget.onSubmit?.call(_selectedStars, _controller.text);
                    },
              borderRadius: BorderRadius.circular(15.r),
              child: Container(
                width: double.infinity,
                height: 52.h,
                decoration: BoxDecoration(
                  color: widget.isLoading
                      ? Colors.grey
                      : context.appColors.primaryColor,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                      color: context.appColors.primaryColor.withValues(alpha: 0.25),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: widget.isLoading
                    ? SizedBox(
                        height: 22.h,
                        width: 22.h,
                        child: CircularProgressIndicator(
                          color: context.appColors.backgroundColor,
                          strokeWidth: 2.5,
                        ),
                      )
                    : Text(
                        'Submit',
                        style: AppStyle.text14Semibold.copyWith(
                          color: context.appColors.backgroundColor,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}