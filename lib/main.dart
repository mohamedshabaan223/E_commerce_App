import 'package:ecommerce_app/core/routing/constant_route.dart';
import 'package:ecommerce_app/core/routing/route_genrator.dart';
import 'package:ecommerce_app/core/theme/app_theme.dart';
import 'package:ecommerce_app/core/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeCubit = await ThemeCubit.load();
  runApp(MyApp(themeCubit: themeCubit));
}

class MyApp extends StatelessWidget {
  final ThemeCubit themeCubit;

  const MyApp({super.key, required this.themeCubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: themeCubit,
      child: ScreenUtilInit(
        designSize: const Size(380, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
            onGenerateRoute: RouteGenrator.getRoute,
            initialRoute: ConstantRoute.splash,
          ),
        ),
      ),
    );
  }
}