import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/categories/data/repo/categories_repo.dart';
import 'package:ecommerce_app/feature/categories/presentation/viewmodels/cubits/category_products_cubit.dart';
import 'package:ecommerce_app/feature/categories/presentation/viewmodels/cubits/category_products_state.dart';
import 'package:ecommerce_app/feature/home/presentation/widgets/all_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          CategoryProductsCubit(CategoriesRepo())..load(categoryName),
      child: Scaffold(
        backgroundColor: context.appColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: context.appColors.backgroundColor,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: context.appColors.primaryColor,
              size: 20.sp,
            ),
            onPressed: () => Navigator.maybePop(context),
          ),
          title: Text(
            categoryName,
            style: AppStyle.text18Semibold.copyWith(
              color: context.appColors.textPrimary,
            ),
          ),
        ),
        body: BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
          builder: (context, state) {
            if (state is CategoryProductsFailure) {
              return Center(
                child: Text(
                  state.message,
                  style: AppStyle.text14Regular.copyWith(
                    color: context.appColors.textSecondary,
                  ),
                ),
              );
            }
            if (state is! CategoryProductsSuccess) {
              return Center(
                child: CircularProgressIndicator(
                  color: context.appColors.primaryColor,
                ),
              );
            }
            if (state.products.isEmpty) {
              return Center(
                child: Text(
                  'No products yet',
                  style: AppStyle.text14Regular.copyWith(
                    color: context.appColors.textSecondary,
                  ),
                ),
              );
            }
            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
              child: AllProductsGrid(products: state.products),
            );
          },
        ),
      ),
    );
  }
}
