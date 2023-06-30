import 'package:finder/widgets/dev_mode_speed_dial_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/repository/bachelor_data_manager.dart';
import '../models/bachelor_model.dart';
import '../providers/favorite_bachelors_provider.dart';
import '../providers/disliked_bachelors_provider.dart';
import '../appbars/home_appbar.dart';
import '../widgets/bachelor_list_preview_widget.dart';

class BachelorsHome extends StatefulWidget {
  @override
  _BachelorsHomeState createState() => _BachelorsHomeState();
}

class _BachelorsHomeState extends State<BachelorsHome> {
  late List<Bachelor> bachelors;
  late List<Bachelor> favoriteBachelors;

  @override
  void initState() {
    super.initState();
    bachelors = BachelorDataManager().getAllBachelors();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteBachelorsProvider =
        Provider.of<FavoriteBachelorsProvider>(context);

    favoriteBachelors = favoriteBachelorsProvider.favoriteBachelors;

    return Scaffold(
      appBar: buildHomeAppBar(favoriteBachelors, context),
      floatingActionButton: DevModeSpeedDial(),
      body: Consumer<DislikedBachelorsProvider>(
        builder: (context, provider, _) {
          final dislikedList = provider.dislikedBachelors;
          final updatedBachelors = bachelors
              .where((bachelor) => !dislikedList.contains(bachelor))
              .toList();

          return BachelorListPreview(
            bachelorList: updatedBachelors,
            favoriteBachelors: favoriteBachelors,
          );
        },
      ),
    );
  }
}
