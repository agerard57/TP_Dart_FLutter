import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../models/bachelor_model.dart';
import '../providers/bachelor_app_provider.dart';

class FavoriteBachelors extends StatelessWidget {
  late final List<Bachelor> favoriteBachelors;

  @override
  Widget build(BuildContext context) {
    favoriteBachelors =
        Provider.of<BachelorAppProvider>(context).favoriteBachelors;

    return Scaffold(
      appBar: AppBar(
          title: Text(AppLocalizations.of(context)!
              .favoritePageTitle(favoriteBachelors.length.toString()))),
      body: ListView.builder(
        itemCount: favoriteBachelors.length,
        itemBuilder: (context, index) {
          final bachelor = favoriteBachelors[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(bachelor.avatar),
            ),
            title: Text(
              bachelor.fullName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            subtitle: Text(
              bachelor.job ?? '',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
              ),
            ),
          );
        },
      ),
    );
  }
}
