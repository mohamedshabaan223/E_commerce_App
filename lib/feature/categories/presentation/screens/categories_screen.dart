import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/categories/data/repo/categories_repo.dart';
import 'package:ecommerce_app/feature/categories/presentation/screens/category_products_screen.dart';
import 'package:ecommerce_app/feature/categories/presentation/viewmodels/cubits/categories_cubit.dart';
import 'package:ecommerce_app/feature/categories/presentation/viewmodels/cubits/categories_state.dart';
import 'package:ecommerce_app/feature/categories/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoriesCubit(CategoriesRepo())..load(),
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
            'Categories',
            style: AppStyle.text18Semibold.copyWith(
              color: context.appColors.textPrimary,
            ),
          ),
        ),
        body: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesFailure) {
              return Center(
                child: Text(
                  state.message,
                  style: AppStyle.text14Regular.copyWith(
                    color: context.appColors.textSecondary,
                  ),
                ),
              );
            }
            if (state is! CategoriesSuccess) {
              return Center(
                child: CircularProgressIndicator(
                  color: context.appColors.primaryColor,
                ),
              );
            }
            return ListView.separated(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 100.h),
              itemCount: state.categories.length,
              separatorBuilder: (_, _) => SizedBox(height: 16.h),
              itemBuilder: (_, i) {
                final category = state.categories[i];
                return CategoryCard(
                  imageUrl: category.coverPictureUrl,
                  title: category.name,
                  subtitle: category.description,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          CategoryProductsScreen(categoryName: category.name),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
