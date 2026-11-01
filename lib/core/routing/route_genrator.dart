import 'package:ecommerce_app/core/routing/constant_route.dart';
import 'package:ecommerce_app/feature/auth/presentation/screens/Logout.dart';
import 'package:ecommerce_app/feature/main/presentation/screens/main_screen.dart';
import 'package:ecommerce_app/feature/order/presentation/screens/order_screen.dart';
import 'package:ecommerce_app/feature/product_details/presentation/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../../feature/auth/presentation/screens/Login.dart';
import '../../feature/auth/presentation/screens/VerifyEmail.dart';
import '../../feature/auth/presentation/screens/signUp.dart';

abstract class RouteGenrator {
  static Route getRoute(RouteSettings settings) {
    switch (settings.name) {
      case ConstantRoute.mainScreen:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case ConstantRoute.orderScreen:
        return MaterialPageRoute(builder: (_) => OrderScreen());
      case ConstantRoute.productDetails:
        return MaterialPageRoute(builder: (_) => const ProductDetailsScreen());
      case ConstantRoute.SignUp:
        return MaterialPageRoute(builder: (_) => const SignUp());
      case ConstantRoute.Login:
        return MaterialPageRoute(builder: (_) => const Login());
      case ConstantRoute.VerifyEmail:
        return MaterialPageRoute(builder: (_) => const VerifyEmail());
      case ConstantRoute.Logout:
        return MaterialPageRoute(builder: (_) => const Logout());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(body: Center(child: Text('No Route Founded'))),
        );
    }
  }
}
