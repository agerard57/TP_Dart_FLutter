import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/bachelor_model.dart';
import '../utils/snackbar_util.dart';

class BachelorAppProvider extends ChangeNotifier {
  List<Bachelor> favoriteBachelors = [];

  void toggleFavorite(Bachelor bachelor, BuildContext context) {
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
        AppLocalizations.of(context)!.snackBarMessageRemoveFavorite,
      );
    }
    notifyListeners();
  }
}
