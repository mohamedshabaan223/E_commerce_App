import 'package:ecommerce_app/feature/home/presentation/widgets/promo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromoBannerCarousel extends StatelessWidget {
  const PromoBannerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: PageView(
        children: const [
          PromoItem(
            imageUrl: 'assets/images/promo_banner.png',
            tag: 'SALE',
            title: 'Mid-Season Sale',
            subtitle: 'Save up to 40% on selected accessories',
          ),
        ],
      ),
    );
  }
}
