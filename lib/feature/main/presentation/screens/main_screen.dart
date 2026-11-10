import 'package:ecommerce_app/core/shared_widgets/bottom_nav_bar.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/cart/Cubit/add_to_cart_cubit.dart';
import 'package:ecommerce_app/feature/cart/Cubit/get_cart_cubit.dart';
import 'package:ecommerce_app/feature/cart/presentation/screens/cart_screen.dart';
import 'package:ecommerce_app/feature/categories/presentation/screens/categories_screen.dart';
import 'package:ecommerce_app/feature/home/presentation/screens/home_screen.dart';
import 'package:ecommerce_app/feature/profile/presentation/screens/profile_screen.dart';
import 'package:ecommerce_app/core/network/dio_factory.dart';
import 'package:ecommerce_app/feature/cart/data/remote_data_sources/cart_remote_data_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GetCartCubit(CartRemoteDataSource(DioFactory().dio)),
        ),
        BlocProvider(
          create: (_) => AddToCartCubit(CartRemoteDataSource(DioFactory().dio)),
        )],
      child: Scaffold(
        backgroundColor: context.appColors.backgroundColor,
        body: IndexedStack(index: _currentIndex, children: _screens),
        bottomNavigationBar: BottomNavBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
        ),
      ),
    );
  }
}
