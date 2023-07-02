import 'package:flutter/material.dart';

import '../constants/app_theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData lightTheme = AppThemeData.lightThemeData;
  ThemeData darkTheme = AppThemeData.darkThemeData;

  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  bool get isDarkModeEnabled => _themeMode == ThemeMode.dark;

  void toggleTheme(bool value) {
    _themeMode = value ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
