import 'package:ecommerce_app/core/routing/constant_route.dart';
import 'package:ecommerce_app/feature/main/presentation/screens/main_screen.dart';
import 'package:ecommerce_app/feature/order/presentation/screens/order_screen.dart';
import 'package:ecommerce_app/feature/product_details/presentation/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

abstract class RouteGenrator {
  static Route getRoute(RouteSettings settings) {
    switch (settings.name) {
      case ConstantRoute.mainScreen:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case ConstantRoute.orderScreen:
        return MaterialPageRoute(builder: (_) => OrderScreen());
      case ConstantRoute.productDetails:
        return MaterialPageRoute(builder: (_) => const ProductDetailsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(body: Center(child: Text('No Route Founded'))),
        );
    }
  }
}
