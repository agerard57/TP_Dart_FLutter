import 'package:flutter/material.dart';

import '../models/bachelor.dart';
import '../utils/snackbar_utils.dart';

class BachelorAppProvider extends ChangeNotifier {
  List<Bachelor> favoriteBachelors = [];

  void toggleFavorite(Bachelor bachelor, BuildContext context) {
    if (favoriteBachelors.contains(bachelor)) {
      favoriteBachelors.remove(bachelor);
      showSnackBar(
        context,
        'You\'ve removed this bachelor from your favorite list.',
      );
    } else {
      favoriteBachelors.add(bachelor);
      showSnackBar(
          context, 'You\'ve added this bachelor to your favorite list!');
    }
    notifyListeners();
  }
}
