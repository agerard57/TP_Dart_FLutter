import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/bachelor_model.dart';

class GenderFilter extends StatelessWidget {
  final Gender? selectedGender;
  final ValueChanged<Gender> onGenderFilterChanged;
  final VoidCallback onResetFilters;
  final String searchQuery;

  const GenderFilter({
    required this.selectedGender,
    required this.onGenderFilterChanged,
    required this.onResetFilters,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    final isMaleSelected = selectedGender == Gender.MALE;
    final isFemaleSelected = selectedGender == Gender.FEMALE;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () => onGenderFilterChanged(Gender.MALE),
            style: ElevatedButton.styleFrom(
              backgroundColor: isMaleSelected ? Colors.grey : Colors.deepPurple,
            ),
            child: Text(
                AppLocalizations.of(context)!.homePageFiltersGenderMaleButton),
          ),
          SizedBox(width: 16.0),
          ElevatedButton(
            onPressed: () => onGenderFilterChanged(Gender.FEMALE),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  isFemaleSelected ? Colors.grey : Colors.deepPurple,
            ),
            child: Text(AppLocalizations.of(context)!
                .homePageFiltersGenderFemaleButton),
          ),
        ],
      ),
    );
  }
}
