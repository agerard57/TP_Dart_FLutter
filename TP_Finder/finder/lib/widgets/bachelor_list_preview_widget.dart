import 'package:flutter/material.dart';

import '../models/bachelor_model.dart';
import 'bachelor_element_preview_widget.dart';

class BachelorListPreview extends StatelessWidget {
  final List<Bachelor> bachelorList;
  final List<Bachelor> favoriteBachelors;

  const BachelorListPreview({
    required this.bachelorList,
    required this.favoriteBachelors,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: bachelorList.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        final bachelor = bachelorList[index];
        final isFavorite = favoriteBachelors.contains(bachelor);

        return BachelorElementPreview(
          bachelor: bachelor,
          isFavorite: isFavorite,
        );
      },
    );
  }
}
