import 'dart:async';

import 'package:ecommerce_app/core/shared_widgets/custom_search_bar.dart';
import 'package:ecommerce_app/core/shared_widgets/product_card.dart';
import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/product_details/presentation/screens/product_details_screen.dart';
import 'package:ecommerce_app/feature/search/data/repo/search_repo.dart';
import 'package:ecommerce_app/feature/search/presentation/viewmodels/search_cubit.dart';
import 'package:ecommerce_app/feature/search/presentation/viewmodels/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(BuildContext context, String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<SearchCubit>().search(value);
    });
  }

  void _clearSearch(BuildContext context) {
    _controller.clear();
    context.read<SearchCubit>().search('');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchCubit(SearchRepo())..search(''),
      child: Builder(
        builder: (context) => Scaffold(
          backgroundColor: context.appColors.backgroundColor,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SearchTopBar(),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: context.appColors.border,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
                  child: CustomSearchBar(
                    controller: _controller,
                    hint: 'Search products',
                    onChanged: (value) => _onChanged(context, value),
                    onClear: () => _clearSearch(context),
                    hasBorder: true,
                  ),
                ),
                SizedBox(height: 16.h),
                Expanded(
                  child: BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      if (state is SearchFailure) {
                        return Center(
                          child: Text(
                            state.message,
                            style: AppStyle.text14Regular.copyWith(
                              color: context.appColors.textSecondary,
                            ),
                          ),
                        );
                      }
                      if (state is! SearchSuccess) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: context.appColors.primaryColor,
                          ),
                        );
                      }
                      final products = state.products;
                      if (products.isEmpty) {
                        return Center(
                          child: Text(
                            'No products found',
                            style: AppStyle.text14Regular.copyWith(
                              color: context.appColors.textSecondary,
                            ),
                          ),
                        );
                      }
                      return ListView(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        children: [
                          Text(
                            '${products.length} results',
                            style: AppStyle.text12Regular.copyWith(
                              color: context.appColors.textSecondary,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: products.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12.w,
                                  mainAxisSpacing: 12.h,
                                  childAspectRatio: 0.62,
                                ),
                            itemBuilder: (_, i) {
                              final p = products[i];
                              final finalPrice =
                                  p.price * (1 - p.discountPercentage / 100);
                              return GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        ProductDetailsScreen(productId: p.id),
                                  ),
                                ),
                                child: ProductCard(
                                  imageUrl: p.coverPictureUrl,
                                  name: p.name,
                                  price: '\$${finalPrice.toStringAsFixed(0)}',
                                  oldPrice: p.discountPercentage > 0
                                      ? '\$${p.price.toStringAsFixed(0)}'
                                      : null,
                                  rating: p.rating,
                                  reviewsCount: p.reviewsCount,
                                  discountPercent: p.discountPercentage > 0
                                      ? p.discountPercentage
                                      : null,
                                  isOutOfStock: p.stock == 0,
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 80.h),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: context.appColors.textPrimary,
                size: 20.sp,
              ),
            ),
          ),
          Text(
            'Search',
            style: AppStyle.text18Medium.copyWith(
              color: context.appColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
