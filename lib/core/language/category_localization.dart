import 'package:ecommerce_app/generated/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

String localizeCategoryName(BuildContext context, String categoryName) {
  final l10n = AppLocalizations.of(context)!;

  switch (categoryName.trim().toLowerCase()) {
    case 'charms':
      return l10n.categoryCharms;

    case 'anklets':
      return l10n.categoryAnklets;

    case 'pendants':
      return l10n.categoryPendants;

    case 'earrings':
      return l10n.categoryEarrings;

    case 'clothes':
      return l10n.categoryClothes;

    case 'bags':
      return l10n.categoryBags;

    case 'jewelry':
      return l10n.categoryJewelry;

    case 'necklaces':
      return l10n.categoryNecklaces;

    case 'bracelets':
      return l10n.categoryBracelets;

    case 'rings':
      return l10n.categoryRings;

    case 'glasses':
      return l10n.categoryGlasses;

    case 'sneakers':
      return l10n.categorySneakers;

    case 'watches':
      return l10n.categoryWatches;

    case 'brooches':
      return l10n.categoryBrooches;

    case 'bangles':
      return l10n.categoryBangles;

    case 'jewelry-sets':
      return l10n.categoryJewelrySets;

    default:
      return categoryName;
  }
}
