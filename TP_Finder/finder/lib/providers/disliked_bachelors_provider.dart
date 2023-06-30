import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../models/bachelor_model.dart';
import '../utils/snackbar_util.dart';
import 'favorite_bachelors_provider.dart';

class DislikedBachelorsProvider extends ChangeNotifier {
  List<Bachelor> dislikedBachelors = [];

  void toggleDisliked(Bachelor bachelor, BuildContext context) {
    if (dislikedBachelors.contains(bachelor)) {
      dislikedBachelors.remove(bachelor);

      showSnackBar(
        context,
        AppLocalizations.of(context)!.snackBarMessageRemoveDisliked,
      );
    } else {
      dislikedBachelors.add(bachelor);

      // Remove from favorites if it's there
      Provider.of<FavoriteBachelorsProvider>(context, listen: false)
          .toggleFavorite(bachelor, context, forceDelete: true);

      showSnackBar(
        context,
        AppLocalizations.of(context)!.snackBarMessageAddDisliked,
      );
    }
    notifyListeners();
  }
}
