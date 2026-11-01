import 'package:ecommerce_app/core/routing/constant_route.dart';
import 'package:ecommerce_app/feature/main/presentation/screens/main_screen.dart';
import 'package:ecommerce_app/feature/order/presentation/screens/order_screen.dart';
import 'package:ecommerce_app/feature/product_details/presentation/screens/product_details_screen.dart';
import 'package:ecommerce_app/feature/reset_password/presentation/screens/otp_verification.dart';
import 'package:ecommerce_app/feature/reset_password/presentation/screens/reset_password.dart';
import 'package:ecommerce_app/feature/reset_password/presentation/screens/updated_screen.dart';
import 'package:flutter/material.dart';

import '../../feature/reset_password/presentation/screens/change_password.dart';
import '../../feature/reset_password/presentation/screens/forget_password.dart';

abstract class RouteGenrator {
  static Route getRoute(RouteSettings settings) {
    switch (settings.name) {
      case ConstantRoute.mainScreen:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case ConstantRoute.orderScreen:
        return MaterialPageRoute(builder: (_) => OrderScreen());
      case ConstantRoute.forgetPassword:
        return MaterialPageRoute(builder: (_) => ForgetPassword());
      case ConstantRoute.changePassword:
        return MaterialPageRoute(builder: (_) => ChangePassword());
      case ConstantRoute.productDetails:
        return MaterialPageRoute(builder: (_) => const ProductDetailsScreen());
      case ConstantRoute.resetPassword:
        return MaterialPageRoute(builder: (_) => ResetPassword());
      case ConstantRoute.updatedDone:
        return MaterialPageRoute(builder: (_) => Updated());
      case ConstantRoute.otpVerification:
        return MaterialPageRoute(builder: (_) => Verification());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(body: Center(child: Text('No Route Founded'))),
        );
    }
  }
}
