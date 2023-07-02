import 'package:flutter/material.dart';

import '../models/bachelor_model.dart';
import 'bachelor_element_list_widget.dart';

class BachelorDisplayList extends StatelessWidget {
  final List<Bachelor> bachelorList;
  final List<Bachelor> favoriteBachelors;
  final bool enableSwipeToDeleteListElement;

  const BachelorDisplayList({
    required this.bachelorList,
    required this.favoriteBachelors,
    required this.enableSwipeToDeleteListElement,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: bachelorList.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        final bachelor = bachelorList[index];
        final isFavorite = favoriteBachelors.contains(bachelor);

        return BachelorElementList(
          bachelor: bachelor,
          isFavorite: isFavorite,
          enableSwipeToDelete: enableSwipeToDeleteListElement,
        );
      },
    );
  }
}
