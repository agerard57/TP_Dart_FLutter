import 'package:finder/widgets/dev_mode_speed_dial_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/bachelor_data_manager.dart';
import '../models/bachelor_model.dart';
import '../providers/bachelor_app_provider.dart';
import '../appbars/home_appbar.dart';
import '../widgets/bachelor_list_preview_widget.dart';

class BachelorsHome extends StatefulWidget {
  @override
  _BachelorsHomeState createState() => _BachelorsHomeState();
}

class _BachelorsHomeState extends State<BachelorsHome> {
  late final List<Bachelor> bachelors;
  late List<Bachelor> favoriteBachelors;

  @override
  void initState() {
    super.initState();
    bachelors = BachelorDataManager().getAllBachelors();
  }

  @override
  Widget build(BuildContext context) {
    final bachelorAppProvider = Provider.of<BachelorAppProvider>(context);

    favoriteBachelors = bachelorAppProvider.favoriteBachelors;

    return Scaffold(
      appBar: buildHomeAppBar(favoriteBachelors, context),
      floatingActionButton: DevModeSpeedDial(),
      body: BachelorListPreview(
        bachelorList: bachelors,
        favoriteBachelors: favoriteBachelors,
      ),
    );
  }
}
