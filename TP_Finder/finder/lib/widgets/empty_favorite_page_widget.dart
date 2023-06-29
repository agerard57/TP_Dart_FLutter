import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget emptyFavoritePage(BuildContext context) {
  return Center(
    child: Text(
      AppLocalizations.of(context)!.favoriteEmptyPageTitle,
      style: TextStyle(fontSize: 16),
    ),
  );
}
