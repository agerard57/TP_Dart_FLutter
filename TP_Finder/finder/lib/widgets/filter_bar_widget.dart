import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:finder/widgets/filter_applied_widget.dart';

import '../models/bachelor_model.dart';
import 'filter_first_name_widget.dart';
import 'filter_gender_widget.dart';
import 'filter_reset_button_widget.dart';

typedef FilterFunction<T> = List<T> Function(T value);

class BachelorFilters {
  static List<Bachelor> filterBachelorsByFirstNameAndGender(
      List<Bachelor> bachelors, String firstName, Gender? gender) {
    return bachelors
        .where((bachelor) =>
            bachelor.firstName.contains(firstName) &&
            (gender == null || bachelor.gender == gender))
        .toList();
  }
}

class FiltersBar extends StatelessWidget {
  final List<Bachelor> bachelors;
  final String searchQuery;
  final Gender? selectedGender;
  final Function(String) onSearchQueryChanged;
  final Function(Gender) onGenderFilterChanged;
  final VoidCallback onResetFilters;

  FiltersBar({
    required this.bachelors,
    required this.searchQuery,
    required this.selectedGender,
    required this.onSearchQueryChanged,
    required this.onGenderFilterChanged,
    required this.onResetFilters,
  });

  @override
  Widget build(BuildContext context) {
    final bool isGenderFilterDisplayed = selectedGender != null;
    final bool isSearchFilterDisplayed = searchQuery.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FirstNameFilter(
            searchQuery: searchQuery,
            onSearchQueryChanged: onSearchQueryChanged),
        SizedBox(height: 16.0),
        GenderFilter(
          selectedGender: selectedGender,
          onGenderFilterChanged: onGenderFilterChanged,
          onResetFilters: onResetFilters,
          searchQuery: searchQuery,
        ),
        SizedBox(height: 16.0),
        if (isGenderFilterDisplayed || isSearchFilterDisplayed)
          Row(
            children: [
              SizedBox(height: 16.0),
              ResetButtonFilter(
                selectedGender: selectedGender,
                onResetFilters: onResetFilters,
                searchQuery: searchQuery,
              ),
              Text(
                AppLocalizations.of(context)!.homePageFiltersAppliedLabel,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        FilterApplied(
            isDisplayed: isGenderFilterDisplayed,
            filterName:
                AppLocalizations.of(context)!.homePageFiltersGenderLabel,
            filterValue: selectedGender == Gender.MALE
                ? AppLocalizations.of(context)!.homePageFiltersGenderMaleChip
                : AppLocalizations.of(context)!
                    .homePageFiltersGenderFemaleChip),
        FilterApplied(
          isDisplayed: isSearchFilterDisplayed,
          filterName:
              AppLocalizations.of(context)!.homePageFiltersFirstNameLabel,
          filterValue: searchQuery,
        ),
      ],
    );
  }
}
