import 'package:ecommerce_app/core/shared_widgets/custom_search_bar.dart';
import 'package:ecommerce_app/core/shared_widgets/section_header.dart';
import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/categories/presentation/screens/categories_screen.dart';
import 'package:ecommerce_app/feature/home/data/repo/home_repo.dart';
import 'package:ecommerce_app/feature/home/presentation/viewmodels/home_cubit.dart';
import 'package:ecommerce_app/feature/home/presentation/viewmodels/home_state.dart';
import 'package:ecommerce_app/feature/home/presentation/widgets/all_products.dart';
import 'package:ecommerce_app/feature/home/presentation/widgets/category_chips_row.dart';
import 'package:ecommerce_app/feature/home/presentation/widgets/home_app_bar.dart';
import 'package:ecommerce_app/feature/home/presentation/widgets/hot_deals.dart';
import 'package:ecommerce_app/feature/home/presentation/widgets/promo_banner.dart';
import 'package:ecommerce_app/feature/profile/presentation/screens/notifications_screen.dart';
import 'package:ecommerce_app/feature/search/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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

            for (final category in state.categories) {
              debugPrint(
                'CATEGORY ID: ${category.id} | NAME: ${category.name}',
              );
            }
          } else if (state is HomeFailure) {
            debugPrint('FAILED: ${state.message}');
          }
        },
        child: Scaffold(
          backgroundColor: context.appColors.backgroundColor,
          appBar: HomeAppBar(
            onNotificationTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const NotificationsScreen()),
            ),
          ),
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
                      if (state.offersError != null) {
                        return Text(
                          state.offersError!,
                          style: AppStyle.text12Regular.copyWith(
                            color: context.appColors.textSecondary,
                          ),
                        );
                      }

                      if (state.offers.isEmpty) return const SizedBox.shrink();
                      return PromoBannerCarousel(offers: state.offers);
                    }
                    if (state is HomeFailure) {
                      return Text(
                        state.message,
                        style: AppStyle.text12Regular.copyWith(
                          color: context.appColors.textSecondary,
                        ),
                      );
                    }
                    return SizedBox(
                      height: 200.h,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: context.appColors.primaryColor,
                        ),
                      ),
                    );
                  },
                ),

                SizedBox(height: 12.h),
                SectionHeader(
                  title: l10n.categories,
                  onViewAll: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CategoriesScreen()),
                  ),
                ),
                SizedBox(height: 12.h),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is HomeFailure) return const SizedBox.shrink();
                    if (state is! HomeSuccess) {
                      return SizedBox(
                        height: 100.h,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: context.appColors.primaryColor,
                          ),
                        ),
                      );
                    }

                    if (state.categoriesError != null) {
                      return Text(
                        state.categoriesError!,
                        style: AppStyle.text12Regular.copyWith(
                          color: context.appColors.textSecondary,
                        ),
                      );
                    }
                    if (state.categories.isEmpty) {
                      return Text(
                        l10n.noCategoriesYet,
                        style: AppStyle.text12Regular.copyWith(
                          color: context.appColors.textSecondary,
                        ),
                      );
                    }
                    return CategoryChipsRow(categories: state.categories);
                  },
                ),
                SizedBox(height: 24.h),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is! HomeSuccess || state.hotDeals.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionHeader(title: l10n.hotDeals),
                        SizedBox(height: 12.h),
                        HotDealsList(products: state.hotDeals),
                        SizedBox(height: 24.h),
                      ],
                    );
                  },
                ),
                SectionHeader(title: l10n.allProducts),
                SizedBox(height: 12.h),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is HomeFailure) return const SizedBox.shrink();
                    if (state is! HomeSuccess) {
                      return SizedBox(
                        height: 120.h,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: context.appColors.primaryColor,
                          ),
                        ),
                      );
                    }
                    if (state.productsError != null) {
                      return Text(
                        state.productsError!,
                        style: AppStyle.text12Regular.copyWith(
                          color: context.appColors.textSecondary,
                        ),
                      );
                    }
                    if (state.products.isEmpty) {
                      return Text(
                        'No products yet',
                        style: AppStyle.text12Regular.copyWith(
                          color: context.appColors.textSecondary,
                        ),
                      );
                    }
                    return AllProductsGrid(products: state.products);
                  },
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
