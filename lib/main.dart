import 'package:ecommerce_app/core/routing/constant_route.dart';
import 'package:ecommerce_app/core/routing/route_genrator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(380, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        onGenerateRoute: RouteGenrator.getRoute,
        initialRoute: ConstantRoute.mainScreen,
      ),
    );
  }
}
