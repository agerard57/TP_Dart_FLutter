import 'package:flutter/material.dart';

import '../models/bachelor_model.dart';
import 'bachelor_element_grid_widget.dart';

class BachelorDisplayGrid extends StatelessWidget {
  final List<Bachelor> bachelorList;
  final List<Bachelor> favoriteBachelors;

  const BachelorDisplayGrid({
    required this.bachelorList,
    required this.favoriteBachelors,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: bachelorList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemBuilder: (context, index) {
        final bachelor = bachelorList[index];
        final isFavorite = favoriteBachelors.contains(bachelor);

        return BachelorElementGrid(
          bachelor: bachelor,
          isFavorite: isFavorite,
        );
      },
    );
  }
}
