import 'package:ecommerce_app/core/shared_widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n/app_localizations.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({required this.onBrowseProducts, super.key});

  final VoidCallback onBrowseProducts;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: context.appColors.backgroundColor,
      appBar: CustomAppBar(title: l10n.cart),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15,
          children: [
            Container(
              decoration: BoxDecoration(
                color: context.appColors.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: context.appColors.categoryCard,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(15),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: context.appColors.primaryColor,
                  size: 29,
                ),
              ),
            ),
            Text(
              l10n.yourCartIsEmpty,
              style: TextStyle(
                color: context.appColors.white,
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              l10n.emptyCartDescription,
              style: TextStyle(
                color: context.appColors.passwordColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                onBrowseProducts();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: context.appColors.primaryColor,
                foregroundColor: context.appColors.cartButtonFg,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                minimumSize: Size(double.infinity, 56),
              ),
              child: Center(
                child: Text(
                  l10n.browseProducts,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: context.appColors.cartButtonFg,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
