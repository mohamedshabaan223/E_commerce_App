import 'package:ecommerce_app/core/cache/secure_storage_cacheing.dart';
import 'package:ecommerce_app/core/theme/app_theme.dart';
import 'package:ecommerce_app/core/theme/theme_cubit.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/profile/presentation/screens/profile_screen.dart';
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
