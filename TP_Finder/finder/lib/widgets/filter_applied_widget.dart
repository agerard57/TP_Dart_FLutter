import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class FilterApplied extends StatelessWidget {
  final bool isDisplayed;
  final String filterName;
  final String filterValue;

  FilterApplied({
    required this.isDisplayed,
    required this.filterName,
    required this.filterValue,
  });

  @override
  Widget build(BuildContext context) {
    return isDisplayed
        ? Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Text(
                  '${filterName}: ',
                  style: TextStyle(color: AppColors['greyChipLabel']),
                ),
                SizedBox(width: 8.0),
                Chip(
                  label: Text(
                    filterValue,
                    style: TextStyle(color: AppColors['greyChipText']),
                  ),
                  backgroundColor: AppColors['greyChip'],
                ),
              ],
            ),
          )
        : SizedBox.shrink();
  }
}
