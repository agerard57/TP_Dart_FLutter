import 'package:hive/hive.dart';

import '../models/bachelor_model.dart';
import 'dummy_data.dart';

class BachelorDataManager {
  final Box _bachelorBox;

  BachelorDataManager() : _bachelorBox = Hive.box('bachelors');

  Future<void> generateBachelors() async {
    await _bachelorBox.clear();
    await _bachelorBox.addAll(generateFakeBachelors());
  }

  Bachelor getBachelor(int id) {
    return _bachelorBox.get(id);
  }

  List<Bachelor> getAllBachelors() {
    return _bachelorBox.values.toList().cast<Bachelor>();
  }

  Future<void> clearAllBachelors() async {
    await _bachelorBox.clear();
  }
}
