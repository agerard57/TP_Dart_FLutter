import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FirstNameFilter extends StatelessWidget {
  final String searchQuery;
  final ValueChanged<String> onSearchQueryChanged;

  const FirstNameFilter({
    required this.searchQuery,
    required this.onSearchQueryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText:
              AppLocalizations.of(context)!.homePageFiltersFirstNamePlaceholder,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        ),
        onChanged: onSearchQueryChanged,
      ),
    );
  }
}
