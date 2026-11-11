import 'package:ecommerce_app/core/cache/secure_storage_cacheing.dart';
import 'package:ecommerce_app/core/routing/constant_route.dart';
import 'package:ecommerce_app/core/routing/route_genrator.dart';
import 'package:ecommerce_app/core/theme/app_theme.dart';
import 'package:ecommerce_app/core/theme/theme_cubit.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/profile/presentation/screens/profile_screen.dart';
import 'package:ecommerce_app/feature/auth/presentation/screens/login.dart';
import 'package:ecommerce_app/feature/onboarding/presentation/screens/onboarding.dart';
import 'package:ecommerce_app/feature/splash/presentation/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('theme defaults to light and restores persisted selection', () async {
    final storage = _ThemeStorage();

    final initialCubit = await ThemeCubit.load(storage: storage);
    expect(initialCubit.state, ThemeMode.light);

    await initialCubit.setDarkMode(true);
    expect(initialCubit.state, ThemeMode.dark);

    final restoredCubit = await ThemeCubit.load(storage: storage);
    expect(restoredCubit.state, ThemeMode.dark);

    await restoredCubit.setDarkMode(false);
    final lightCubit = await ThemeCubit.load(storage: storage);
    expect(lightCubit.state, ThemeMode.light);
  });

  testWidgets('theme mode updates the MaterialApp dynamically', (tester) async {
    final cubit = await ThemeCubit.load(storage: _ThemeStorage());

    await tester.pumpWidget(
      BlocProvider.value(
        value: cubit,
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) => MaterialApp(
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
            home: Builder(
              builder: (context) => Text(
                Theme.of(context).brightness == Brightness.dark
                    ? 'dark'
                    : 'light',
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.text('light'), findsOneWidget);

    await cubit.setDarkMode(true);
    await tester.pumpAndSettle();
    expect(find.text('dark'), findsOneWidget);

    await cubit.setDarkMode(false);
    await tester.pumpAndSettle();
    expect(find.text('light'), findsOneWidget);
  });

  testWidgets('Profile switch changes the app theme', (tester) async {
    final cubit = await ThemeCubit.load(storage: _ThemeStorage());

    await tester.pumpWidget(
      BlocProvider.value(
        value: cubit,
        child: ScreenUtilInit(
          designSize: const Size(380, 690),
          child: BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) => MaterialApp(
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              themeMode: themeMode,
              home: const ProfileScreen(),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.widget<Switch>(find.byType(Switch)).value, isFalse);
    expect(
      tester.widget<Scaffold>(find.byType(Scaffold).first).backgroundColor,
      ColorsManger.lightBackground,
    );

    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();

    expect(tester.widget<Switch>(find.byType(Switch)).value, isTrue);
    expect(
      tester.widget<Scaffold>(find.byType(Scaffold).first).backgroundColor,
      ColorsManger.darkBackground,
    );
  });

  testWidgets('splash routes first-time users to onboarding', (tester) async {
    final storage = _FakeStorage();

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(380, 690),
        child: MaterialApp(
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.light,
          onGenerateRoute: RouteGenrator.getRoute,
          home: SplashScreen(storage: storage),
        ),
      ),
    );
    await tester.pump(const Duration(seconds: 4));
    await tester.pumpAndSettle();

    expect(find.byType(Onboarding), findsOneWidget);
  });

  testWidgets('splash skips onboarding when already completed', (tester) async {
    final storage = _FakeStorage()..onboardingCompleted = true;

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(380, 690),
        child: MaterialApp(
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.light,
          onGenerateRoute: RouteGenrator.getRoute,
          home: SplashScreen(storage: storage),
        ),
      ),
    );
    await tester.pump(const Duration(seconds: 4));
    await tester.pumpAndSettle();

    expect(find.byType(Onboarding), findsNothing);
    expect(find.byType(Login), findsOneWidget);
  });

  testWidgets('splash goes to main screen when a session token exists', (
    tester,
  ) async {
    final storage = _FakeStorage()..accessToken = 'token';

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(380, 690),
        child: MaterialApp(
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.light,
          onGenerateRoute: (settings) {
            if (settings.name == ConstantRoute.mainScreen) {
              return MaterialPageRoute(
                settings: settings,
                builder: (_) => const Text('main'),
              );
            }
            return RouteGenrator.getRoute(settings);
          },
          home: SplashScreen(storage: storage),
        ),
      ),
    );
    await tester.pump(const Duration(seconds: 4));
    await tester.pumpAndSettle();

    expect(find.byType(Onboarding), findsNothing);
    expect(find.byType(Login), findsNothing);
    expect(find.text('main'), findsOneWidget);
  });

  testWidgets('onboarding skip completes and navigates to login', (tester) async {
    final storage = _FakeStorage();

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(380, 690),
        child: MaterialApp(
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.light,
          home: Onboarding(storage: storage),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('skip'));
    await tester.pumpAndSettle();

    expect(storage.onboardingCompleted, isTrue);
    expect(find.byType(Onboarding), findsNothing);
    expect(find.byType(Login), findsOneWidget);
  });

  testWidgets('get started completes onboarding and navigates to login', (
    tester,
  ) async {
    final storage = _FakeStorage();

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(380, 690),
        child: MaterialApp(
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.light,
          home: Onboarding(storage: storage),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('NEXT'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('NEXT'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('GET STARTED'));
    await tester.pumpAndSettle();

    expect(storage.onboardingCompleted, isTrue);
    expect(find.byType(Login), findsOneWidget);
  });
}

class _ThemeStorage extends SecureStorageCacheing {
  bool? _isDarkMode;

  @override
  Future<bool?> getIsDarkMode() async => _isDarkMode;

  @override
  Future<void> saveThemeMode(bool isDarkMode) async {
    _isDarkMode = isDarkMode;
  }
}

class _FakeStorage extends SecureStorageCacheing {
  bool? isDarkMode;
  String? accessToken;
  bool onboardingCompleted = false;

  @override
  Future<bool?> getIsDarkMode() async => isDarkMode;

  @override
  Future<void> saveThemeMode(bool isDarkMode) async {
    this.isDarkMode = isDarkMode;
  }

  @override
  Future<String?> getAccessToken() async => accessToken;

  @override
  Future<bool> getOnboardingCompleted() async => onboardingCompleted;

  @override
  Future<void> saveOnboardingCompleted() async {
    onboardingCompleted = true;
  }
}
