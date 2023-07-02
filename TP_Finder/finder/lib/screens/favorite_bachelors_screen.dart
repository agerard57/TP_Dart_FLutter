import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/bachelor_model.dart';
import '../models/bachelors_display_model.dart';
import '../providers/favorite_bachelors_provider.dart';
import '../widgets/bachelors_display_manager_widget.dart';

class FavoriteBachelors extends StatefulWidget {
  @override
  _FavoriteBachelorsState createState() => _FavoriteBachelorsState();
}

class _FavoriteBachelorsState extends State<FavoriteBachelors> {
  late List<Bachelor> favoriteBachelors;

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteBachelorsProvider>(
      builder: (context, provider, _) {
        final favoriteBachelors = provider.favoriteBachelors;

        void deleteAllFavorites() {
          provider.deleteAllFavorites(context);
        }

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: BackButton(onPressed: () => GoRouter.of(context).go('/')),
            title: Text(
              AppLocalizations.of(context)!
                  .favoritePageTitle(favoriteBachelors.length.toString()),
            ),
            actions: [
              Tooltip(
                message: AppLocalizations.of(context)!.favoriteDeleteAllTooltip,
                child: IconButton(
                  onPressed: deleteAllFavorites,
                  icon: Icon(Icons.delete),
                ),
              ),
            ],
          ),
          body: BachelorDisplayManager(
            mode: BachelorsDisplayMode.LIST,
            bachelorList: favoriteBachelors,
            favoriteBachelors: favoriteBachelors,
            enableSwipeToDeleteListElement: true,
          ),
        );
      },
    );
  }
}
