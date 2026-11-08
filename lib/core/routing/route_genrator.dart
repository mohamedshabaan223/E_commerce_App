import 'package:ecommerce_app/core/routing/constant_route.dart';
import 'package:ecommerce_app/feature/auth/presentation/cubits/auth_cubit.dart';
import 'package:ecommerce_app/feature/auth/presentation/screens/Login.dart';
import 'package:ecommerce_app/feature/auth/presentation/screens/Logout.dart';
import 'package:ecommerce_app/feature/auth/presentation/screens/VerifyEmail.dart';
import 'package:ecommerce_app/feature/auth/presentation/screens/signUp.dart';
import 'package:ecommerce_app/feature/main/presentation/screens/main_screen.dart';
import 'package:ecommerce_app/feature/onboarding/presentation/screens/onboarding.dart';
import 'package:ecommerce_app/feature/order/presentation/screens/checkout_screen.dart';
import 'package:ecommerce_app/feature/order/presentation/screens/order_details_screen.dart';
import 'package:ecommerce_app/feature/order/presentation/screens/order_screen.dart';
import 'package:ecommerce_app/feature/product_details/presentation/screens/product_details_screen.dart';
import 'package:ecommerce_app/feature/splash/presentation/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class RouteGenrator {
  static Route getRoute(RouteSettings settings) {
    switch (settings.name) {
      case ConstantRoute.mainScreen:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case ConstantRoute.orderScreen:
        return MaterialPageRoute(builder: (_) => OrderScreen());
      case ConstantRoute.checkoutScreen:
        return MaterialPageRoute(builder: (_) => CheckoutScreen());
      case ConstantRoute.orderDeatilsScreen:
        return MaterialPageRoute(builder: (_) => OrderDetailsScreen());
      case ConstantRoute.productDetails:
        return MaterialPageRoute(builder: (_) => const ProductDetailsScreen());
      case ConstantRoute.Login:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(create: (context) => AuthCubit(), child: Login()),
        );
      case ConstantRoute.SignUp:
        return MaterialPageRoute(builder: (_) => const SignUp());
      case ConstantRoute.VerifyEmail:
        final email = settings.arguments as String;
        return MaterialPageRoute(builder: (_) =>  VerifyEmail(email:email),);
      case ConstantRoute.Logout:
        return MaterialPageRoute(builder: (_) => const Logout());
      case ConstantRoute.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case ConstantRoute.onboarding:
        return MaterialPageRoute(builder: (_) => const Onboarding());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(body: Center(child: Text('No Route Founded'))),
        );
    }
  }
}
