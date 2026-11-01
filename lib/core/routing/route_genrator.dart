import 'package:ecommerce_app/core/routing/constant_route.dart';
import 'package:ecommerce_app/feature/admin/presentation/screens/add_product_screen.dart';
import 'package:ecommerce_app/feature/admin/presentation/screens/admin_screens.dart';
// import 'package:ecommerce_app/feature/admin/presentation/screens/delete_product_screen.dart';
import 'package:ecommerce_app/feature/admin/presentation/screens/product_list_screen.dart';
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
      case ConstantRoute.adminScreen:
        return MaterialPageRoute(builder: (_) => AdminScreens());
      case ConstantRoute.productListScreen:
        return MaterialPageRoute(
          builder: (_) => ProductListcreen(products: []),
        );
      case ConstantRoute.productDetails:
        return MaterialPageRoute(builder: (_) => const ProductDetailsScreen());
      case ConstantRoute.addProductScren:
        return MaterialPageRoute(builder: (_) => const AddProductScreen());
      // case ConstantRoute.deleteProductScren:
      //   return MaterialPageRoute(builder: (_) => DeleteProductsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(body: Center(child: Text('No Route Founded'))),
        );
    }
  }
}
