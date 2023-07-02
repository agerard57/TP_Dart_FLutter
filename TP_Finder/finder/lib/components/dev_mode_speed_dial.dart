import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';

import '../constants/app_colors.dart';
import '../finder_app.dart';
import '../providers/theme_provider.dart';

class DevModeSpeedDial extends StatelessWidget {
  @override
  SpeedDial build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      closeManually: true,
      curve: Curves.bounceIn,
      tooltip: AppLocalizations.of(context)!.devModeSpeedDialTooltip,
      heroTag: 'developper-mode-speed-dial',
      elevation: 8.0,
      overlayColor: themeProvider.isDarkModeEnabled
          ? AppColors['black']
          : AppColors['white'],
      foregroundColor: AppColors['white'],
      overlayOpacity: 0.3,
      backgroundColor: AppColors['primary'],
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
          child: Icon(
            Icons.language,
            color: themeProvider.isDarkModeEnabled
                ? AppColors['white']
                : AppColors['black'],
          ),
          onTap: () => FinderApp.of(context)!.switchLocale(),
          label: AppLocalizations.of(context)!.devModeSpeedDialLanguageLabel,
          labelStyle: TextStyle(fontSize: 18.0),
          labelBackgroundColor: themeProvider.isDarkModeEnabled
              ? AppColors['black']
              : AppColors['white'],
        ),
      ],
    );
  }
}
