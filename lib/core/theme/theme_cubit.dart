import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/cache/secure_storage_cacheing.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit._(this._storage, super.initialState);

  final SecureStorageCacheing _storage;

  static Future<ThemeCubit> load({SecureStorageCacheing? storage}) async {
    final themeStorage = storage ?? SecureStorageCacheing();
    final isDarkMode = await themeStorage.getIsDarkMode() ?? false;
    return ThemeCubit._(
      themeStorage,
      isDarkMode ? ThemeMode.dark : ThemeMode.light,
    );
  }

  Future<void> setDarkMode(bool isDarkMode) async {
    final themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    emit(themeMode);
    await _storage.saveThemeMode(isDarkMode);
  }
}
