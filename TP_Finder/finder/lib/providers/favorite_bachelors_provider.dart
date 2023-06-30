import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/bachelor_model.dart';
import '../utils/snackbar_util.dart';

class FavoriteBachelorsProvider extends ChangeNotifier {
  List<Bachelor> favoriteBachelors = [];

  void toggleFavorite(Bachelor bachelor, BuildContext context,
      {bool forceDelete = false}) {
    if (favoriteBachelors.contains(bachelor)) {
      favoriteBachelors.remove(bachelor);
      showSnackBar(
        context,
        AppLocalizations.of(context)!.snackBarMessageRemoveFavorite,
      );
    } else {
      favoriteBachelors.add(bachelor);
      showSnackBar(
        context,
        AppLocalizations.of(context)!.snackBarMessageAddFavorite,
      );
    }

    if (forceDelete) {
      favoriteBachelors.remove(bachelor);
    }

    notifyListeners();
  }
}
