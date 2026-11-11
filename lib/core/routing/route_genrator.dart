import 'package:ecommerce_app/core/network/dio_factory.dart';
import 'package:ecommerce_app/core/routing/constant_route.dart';
import 'package:ecommerce_app/feature/admin/presentation/screens/admin_screens.dart';
import 'package:ecommerce_app/feature/auth/presentation/cubits/auth_cubit.dart';
import 'package:ecommerce_app/feature/auth/presentation/screens/login.dart';
import 'package:ecommerce_app/feature/auth/presentation/screens/logout.dart';
import 'package:ecommerce_app/feature/auth/presentation/screens/verify_email.dart';
import 'package:ecommerce_app/feature/auth/presentation/screens/sign_up.dart';
import 'package:ecommerce_app/feature/cart/Cubit/get_cart_cubit.dart';
import 'package:ecommerce_app/feature/cart/data/remote_data_sources/cart_remote_data_source.dart';
import 'package:ecommerce_app/feature/main/presentation/screens/main_screen.dart';
import 'package:ecommerce_app/feature/onboarding/presentation/screens/onboarding.dart';
import 'package:ecommerce_app/feature/order/presentation/screens/checkout_screen.dart';
import 'package:ecommerce_app/feature/order/presentation/screens/order_details_screen.dart';
import 'package:ecommerce_app/feature/order/presentation/screens/order_screen.dart';
import 'package:ecommerce_app/feature/product_details/presentation/screens/product_details_screen.dart';
import 'package:ecommerce_app/feature/splash/presentation/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/cart/presentation/screens/cart_screen.dart';
import '../../feature/cart/presentation/screens/empty_cart_screen.dart';

abstract class RouteGenrator {
  static Route getRoute(RouteSettings settings) {
    switch (settings.name) {
      case ConstantRoute.mainScreen:
        return MaterialPageRoute(builder: (_) => const MainScreen());

      case ConstantRoute.adminScreen:
        return MaterialPageRoute(builder: (_) => AdminScreens());

      case ConstantRoute.orderScreen:
        return MaterialPageRoute(builder: (_) => OrderScreen());

      case ConstantRoute.checkoutScreen:
        return MaterialPageRoute(builder: (_) => CheckoutScreen());

      case ConstantRoute.orderDeatilsScreen:
        return MaterialPageRoute(builder: (_) => OrderDetailsScreen());

      case ConstantRoute.productDetails:
        return MaterialPageRoute(
          builder: (_) =>
              ProductDetailsScreen(productId: settings.arguments as String),
        );

      case ConstantRoute.login:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(create: (context) => AuthCubit(), child: Login()),
        );

      case ConstantRoute.signUp:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(create: (context) => AuthCubit(), child: SignUp()),
        );

      case ConstantRoute.verifyEmail:
        final email = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => VerifyEmail(email: email));

      case ConstantRoute.logout:
        return MaterialPageRoute(builder: (_) => const Logout());

      case ConstantRoute.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case ConstantRoute.onboarding:
        return MaterialPageRoute(builder: (_) => const Onboarding());

      case ConstantRoute.emptyCartScreen:
        return MaterialPageRoute(
          builder: (_) => EmptyCartScreen(onBrowseProducts: () {}),
        );

      case ConstantRoute.cartScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                GetCartCubit(CartRemoteDataSource(DioFactory().dio)),
            child: CartScreen(onBrowseProducts: () {}),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(body: Center(child: Text('No Route Founded'))),
        );
    }
  }
}
