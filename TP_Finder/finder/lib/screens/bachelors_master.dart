import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/bachelor_data_manager.dart';
import '../models/bachelor.dart';
import '../providers/provider.dart';
import '../widgets/appbar.dart';
import '../widgets/bachelor_preview.dart';

class BachelorsMasters extends StatefulWidget {
  @override
  _BachelorsMastersState createState() => _BachelorsMastersState();
}

class _BachelorsMastersState extends State<BachelorsMasters> {
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
      appBar: buildAppBar(favoriteBachelors, context),
      body: ListView.separated(
        itemCount: bachelors.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          final bachelor = bachelors[index];
          final isFavorite = favoriteBachelors.contains(bachelor);

          return BachelorPreview(
            bachelor: bachelor,
            isFavorite: isFavorite,
          );
        },
      ),
    );
  }
}
