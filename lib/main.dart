import 'package:ecommerce_app/core/routing/constant_route.dart';
import 'package:ecommerce_app/core/routing/route_genrator.dart';
import 'package:ecommerce_app/feature/auth/data/auth_remote.dart';
import 'package:ecommerce_app/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(380, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        create: (context) => AuthCubit(AuthRemote()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'DMSerifDisplay',
          ),
          onGenerateRoute: RouteGenrator.getRoute,
          initialRoute: ConstantRoute.splash,
        ),
      ),
    );
  }
}