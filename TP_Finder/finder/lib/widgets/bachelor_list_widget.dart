import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../finder_app.dart';

class DevModeSpeedDial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      closeManually: true,
      curve: Curves.bounceIn,
      tooltip: AppLocalizations.of(context)!.devModeSpeedDialTooltip,
      heroTag: 'developper-mode-speed-dial',
      elevation: 8.0,
      overlayColor: Colors.black,
      overlayOpacity: 0.3,
      backgroundColor: Colors.deepPurple,
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
          child: Icon(Icons.language),
          backgroundColor: Colors.grey[100],
          onTap: () => FinderApp.of(context)!.switchLocale(),
          label: AppLocalizations.of(context)!.devModeSpeedDialLanguageLabel,
          labelStyle: TextStyle(fontSize: 18.0),
          labelBackgroundColor: Colors.grey[100],
        ),
      ],
    );
  }
}
