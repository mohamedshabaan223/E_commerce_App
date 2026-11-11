// import 'package:ecommerce_app/core/routing/constant_route.dart';
// import 'package:ecommerce_app/core/routing/route_genrator.dart';
// import 'package:ecommerce_app/core/theme/app_theme.dart';
// import 'package:ecommerce_app/core/theme/theme_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'core/network/dio_factory.dart';
// import 'feature/cart/Cubit/get_cart_cubit.dart';
// import 'feature/cart/data/remote_data_sources/cart_remote_data_source.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final themeCubit = await ThemeCubit.load();
//   runApp(MyApp(themeCubit: themeCubit));
// }
//
// class MyApp extends StatelessWidget {
//   final ThemeCubit themeCubit;
//
//   const MyApp({super.key, required this.themeCubit});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider.value(value: themeCubit),
//         BlocProvider(
//           create: (_) => GetCartCubit(CartRemoteDataSource(DioFactory().dio)),
//         ),
//       ],
//       child: ScreenUtilInit(
//         designSize: const Size(380, 690),
//         minTextAdapt: true,
//         splitScreenMode: true,
//         child: BlocBuilder<ThemeCubit, ThemeMode>(
//           builder: (context, themeMode) => MaterialApp(
//             debugShowCheckedModeBanner: false,
//             theme: AppTheme.light,
//             darkTheme: AppTheme.dark,
//             themeMode: themeMode,
//             onGenerateRoute: RouteGenrator.getRoute,
//             initialRoute: ConstantRoute.onboarding,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:ecommerce_app/core/routing/constant_route.dart';
import 'package:ecommerce_app/core/routing/route_genrator.dart';
import 'package:ecommerce_app/core/theme/app_theme.dart';
import 'package:ecommerce_app/core/theme/theme_cubit.dart';
import 'package:ecommerce_app/generated/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/language/lang_cubit.dart';
import 'core/network/dio_factory.dart';
import 'feature/cart/Cubit/get_cart_cubit.dart';
import 'feature/cart/data/remote_data_sources/cart_remote_data_source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeCubit = await ThemeCubit.load();
  final languageCubit = await LanguageCubit.load();

  runApp(MyApp(themeCubit: themeCubit, languageCubit: languageCubit));
}

class MyApp extends StatelessWidget {
  final ThemeCubit themeCubit;
  final LanguageCubit languageCubit;

  const MyApp({
    super.key,
    required this.themeCubit,
    required this.languageCubit,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: themeCubit),

        BlocProvider.value(value: languageCubit),

        BlocProvider(
          create: (_) => GetCartCubit(CartRemoteDataSource(DioFactory().dio)),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(380, 690),
        minTextAdapt: true,
        splitScreenMode: true,

        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            return BlocBuilder<LanguageCubit, Locale>(
              builder: (context, locale) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,

                  theme: AppTheme.light,
                  darkTheme: AppTheme.dark,
                  themeMode: themeMode,

                  locale: locale,

                  supportedLocales: AppLocalizations.supportedLocales,

                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],

                  onGenerateRoute: RouteGenrator.getRoute,
                  initialRoute: ConstantRoute.splash,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
