import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/cache/secure_storage_cacheing.dart';
import 'package:flutter/material.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit._(this._storage, super.initialState);

  final SecureStorageCacheing _storage;

  static Future<LanguageCubit> load({SecureStorageCacheing? storage}) async {
    final languageStorage = storage ?? SecureStorageCacheing();

    final savedLanguage = await languageStorage.getLanguageCode();

    final languageCode = savedLanguage == 'ar' ? 'ar' : 'en';

    return LanguageCubit._(languageStorage, Locale(languageCode));
  }

  Future<void> changeLanguage(String languageCode) async {
    if (languageCode != 'ar' && languageCode != 'en') {
      return;
    }

    emit(Locale(languageCode));

    await _storage.saveLanguageCode(languageCode);
  }
}
