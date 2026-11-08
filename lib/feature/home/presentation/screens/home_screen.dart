import 'package:ecommerce_app/core/shared_widgets/custom_search_bar.dart';
import 'package:ecommerce_app/core/shared_widgets/section_header.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/home/presentation/viewmodels/home_cubit.dart';
import 'package:ecommerce_app/feature/home/presentation/viewmodels/home_state.dart';
import 'package:ecommerce_app/feature/home/presentation/widgets/all_products.dart';
import 'package:ecommerce_app/feature/home/presentation/widgets/category_chips_row.dart';
import 'package:ecommerce_app/feature/home/presentation/widgets/home_app_bar.dart';
import 'package:ecommerce_app/feature/home/presentation/widgets/hot_deals.dart';
import 'package:ecommerce_app/feature/home/presentation/widgets/promo_banner.dart';
import 'package:ecommerce_app/feature/search/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/feature/home/data/repo/home_repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product_details/presentation/screens/product_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(HomeRepo())..load(),
      child: BlocListener<HomeCubit, HomeState>(
        listener: (_, state) {
          if (state is HomeSuccess) {
            debugPrint(
              'offers=${state.offers.length} (${state.offersError}) | '
              'categories=${state.categories.length} (${state.categoriesError}) | '
              'products=${state.products.length} (${state.productsError})',
            );
          } else if (state is HomeFailure) {
            debugPrint('FAILED: ${state.message}');
          }
        },
        child: Scaffold(
          backgroundColor: ColorsManger.backgroundColor,
          appBar: const HomeAppBar(),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                CustomSearchBar(
                  readOnly: true,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const SearchScreen()),
                  ),
                ),
                SizedBox(height: 12.h),

                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is HomeSuccess) {
                      if (state.offers.isEmpty) return const SizedBox.shrink();
                      return PromoBannerCarousel(offers: state.offers);
                    }
                    if (state is HomeFailure) return const SizedBox.shrink();
                    return SizedBox(
                      height: 200.h,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: ColorsManger.primaryColor,
                        ),
                      ),
                    );
                  },
                ),

                SizedBox(height: 12.h),
                SectionHeader(title: 'Categories', onViewAll: () {}),
                SizedBox(height: 12.h),
                const CategoryChipsRow(),
                SizedBox(height: 24.h),
                SectionHeader(title: 'Hot Deals'),
                SizedBox(height: 12.h),
                const HotDealsList(),
                SizedBox(height: 24.h),
                const SectionHeader(title: 'All Products'),
                SizedBox(height: 12.h),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            ProductDetailsScreen(),
                      ),
                    );
                  },
                  child: const AllProductsGrid(),
                ),
                SizedBox(height: 80.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
