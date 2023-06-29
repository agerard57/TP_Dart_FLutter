import 'package:flutter/material.dart';

import '../models/bachelor.dart';

class FavoriteBachelorsProvider extends ChangeNotifier {
  List<Bachelor> favoriteBachelors = [];

  void toggleFavorite(Bachelor bachelor) {
    // Toggle the favorite status and notify listeners
    if (favoriteBachelors.contains(bachelor)) {
      favoriteBachelors.remove(bachelor);
    } else {
      favoriteBachelors.add(bachelor);
    }
    notifyListeners();
  }
}
