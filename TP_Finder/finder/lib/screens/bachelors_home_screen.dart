import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/repository/bachelor_data_manager.dart';
import '../models/bachelor_model.dart';
import '../models/bachelors_display_model.dart';
import '../providers/favorite_bachelors_provider.dart';
import '../providers/disliked_bachelors_provider.dart';
import '../appbars/home_appbar.dart';
import '../widgets/bachelors_display_manager_widget.dart';
import '../widgets/dev_mode_speed_dial_widget.dart';
import '../widgets/filter_bar_widget.dart';

class BachelorsHome extends StatefulWidget {
  @override
  _BachelorsHomeState createState() => _BachelorsHomeState();
}

class _BachelorsHomeState extends State<BachelorsHome> {
  late List<Bachelor> bachelors;
  late List<Bachelor> favoriteBachelors;
  late List<Bachelor> filteredBachelors;
  String searchQuery = '';
  Gender? selectedGender;

  @override
  void initState() {
    super.initState();
    bachelors = BachelorDataManager().getAllBachelors();
    filteredBachelors = bachelors;
  }

  void resetFilters() {
    setState(() {
      selectedGender = null;
      searchQuery = '';
      filteredBachelors = bachelors;
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoriteBachelorsProvider =
        Provider.of<FavoriteBachelorsProvider>(context);

    favoriteBachelors = favoriteBachelorsProvider.favoriteBachelors;

    return Scaffold(
      appBar: buildHomeAppBar(favoriteBachelors, context),
      floatingActionButton: DevModeSpeedDial(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FiltersBar(
            bachelors: bachelors,
            searchQuery: searchQuery,
            selectedGender: selectedGender,
            onSearchQueryChanged: (value) {
              setState(() {
                searchQuery = value;
                filteredBachelors =
                    BachelorFilters.filterBachelorsByFirstNameAndGender(
                        bachelors, value, selectedGender);
              });
            },
            onGenderFilterChanged: (gender) {
              setState(() {
                selectedGender = gender;
                filteredBachelors =
                    BachelorFilters.filterBachelorsByFirstNameAndGender(
                        bachelors, searchQuery, gender);
              });
            },
            onResetFilters: resetFilters,
          ),
          Expanded(
            child: Consumer<DislikedBachelorsProvider>(
              builder: (context, provider, _) {
                final dislikedList = provider.dislikedBachelors;
                final updatedBachelors = filteredBachelors
                    .where((bachelor) => !dislikedList.contains(bachelor))
                    .toList();

                return BachelorDisplayManager(
                  mode: BachelorsDisplayMode.ALL,
                  bachelorList: updatedBachelors,
                  favoriteBachelors: favoriteBachelors,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
