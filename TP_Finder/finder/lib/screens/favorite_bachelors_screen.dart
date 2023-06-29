import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/bachelor_model.dart';
import '../providers/bachelor_app_provider.dart';
import '../widgets/bachelor_list_preview_widget.dart';
import '../widgets/empty_favorite_page_widget.dart';

class FavoriteBachelors extends StatefulWidget {
  @override
  _FavoriteBachelorsState createState() => _FavoriteBachelorsState();
}

class _FavoriteBachelorsState extends State<FavoriteBachelors> {
  late List<Bachelor> favoriteBachelors;

  @override
  Widget build(BuildContext context) {
    favoriteBachelors =
        Provider.of<BachelorAppProvider>(context).favoriteBachelors;

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: BackButton(onPressed: () => GoRouter.of(context).go("/")),
          title: Text(AppLocalizations.of(context)!
              .favoritePageTitle(favoriteBachelors.length.toString()))),
      body: favoriteBachelors.isEmpty
          ? emptyFavoritePage(context)
          : BachelorListPreview(
              bachelorList: favoriteBachelors,
              favoriteBachelors: favoriteBachelors,
            ),
    );
  }
}
