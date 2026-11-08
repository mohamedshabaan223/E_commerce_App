import 'package:ecommerce_app/feature/home/presentation/widgets/promo_item.dart';
import 'package:ecommerce_app/feature/home/data/models/offer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromoBannerCarousel extends StatelessWidget {
  const PromoBannerCarousel({super.key, required this.offers});

  final List<OfferModel> offers;
  @override
  Widget build(BuildContext context) {
    final shown = offers.take(5).toList();

    return SizedBox(
      height: 200.h,
      child: PageView.builder(
        itemCount: shown.length,

        itemBuilder: (_, i) {
          final offer = shown[i];
          return PromoItem(
            imageUrl: offer.coverUrl,
            tag: 'SALE',
            title: offer.name,
            subtitle: offer.description,
          );
        },
      ),
    );
  }
}
