import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

Drawer buildHomeAppDrawer(BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context);
  final localizations = AppLocalizations.of(context)!;

  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: Text(
            localizations.homePageDrawerTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          title: Text(themeProvider.isDarkModeEnabled
              ? localizations.homePageDrawerLightThemeLabel
              : localizations.homePageDrawerDarkThemeLabel),
          trailing: Icon(
            themeProvider.isDarkModeEnabled
                ? Icons.wb_sunny
                : Icons.nights_stay,
          ),
          onTap: () =>
              themeProvider.toggleTheme(!themeProvider.isDarkModeEnabled),
        ),
      ],
    ),
  );
}
