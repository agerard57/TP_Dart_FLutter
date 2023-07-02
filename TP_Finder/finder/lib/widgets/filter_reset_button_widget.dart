import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../constants/app_colors.dart';
import '../models/bachelor_model.dart';

class ResetButtonFilter extends StatelessWidget {
  final Gender? selectedGender;
  final VoidCallback onResetFilters;
  final String searchQuery;

  const ResetButtonFilter({
    required this.selectedGender,
    required this.onResetFilters,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    final areFiltersApplied = selectedGender != null || searchQuery.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: onResetFilters,
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  areFiltersApplied ? AppColors['red'] : AppColors['grey'],
              foregroundColor: AppColors["white"],
            ),
            child: Text(
              AppLocalizations.of(context)!.homePageFiltersResetButton,
            ),
          ),
        ],
      ),
    );
  }
}
