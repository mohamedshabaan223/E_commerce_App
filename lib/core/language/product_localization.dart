import 'package:flutter/material.dart';

String localizedProductName(
  BuildContext context, {
  required String name,
  required String arabicName,
}) {
  final isArabic = Localizations.localeOf(context).languageCode == 'ar';

  if (isArabic && arabicName.isNotEmpty) {
    return arabicName;
  }

  return name;
}

String localizedProductDescription(
  BuildContext context, {
  required String description,
  required String arabicDescription,
}) {
  final isArabic = Localizations.localeOf(context).languageCode == 'ar';

  if (isArabic && arabicDescription.isNotEmpty) {
    return arabicDescription;
  }

  return description;
}
