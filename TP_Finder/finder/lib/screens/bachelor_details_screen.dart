import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../data/bachelor_data_manager.dart';
import '../providers/bachelor_app_provider.dart';
import '../widgets/favorite_button_widget.dart';

class BachelorDetails extends StatelessWidget {
  final int id;

  const BachelorDetails({
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final bachelor = BachelorDataManager().getBachelor(id);
    final bachelorAppProvider = Provider.of<BachelorAppProvider>(context);
    final favoriteBachelors = bachelorAppProvider.favoriteBachelors;
    final isFavorite = favoriteBachelors.contains(bachelor);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => GoRouter.of(context).go("/")),
        title: Text(AppLocalizations.of(context)!.detailsPageTitle(
          bachelor.fullName,
        )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: bachelor.avatar,
              child: CircleAvatar(
                backgroundImage: AssetImage(bachelor.avatar),
                radius: 50,
              ),
            ),
            SizedBox(height: 20),
            Text(
              bachelor.fullName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              bachelor.job ?? '',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.detailsPageDescription,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                bachelor.description ?? '',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            FavoriteButton(
              isFavorite: isFavorite,
              onPressed: () =>
                  bachelorAppProvider.toggleFavorite(bachelor, context),
            ),
          ],
        ),
      ),
    );
  }
}
