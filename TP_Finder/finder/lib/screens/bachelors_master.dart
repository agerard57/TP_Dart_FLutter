import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/bachelor.dart';
import '../widgets/appbar.dart';
import '../widgets/bachelor_preview.dart';

class BachelorsMasters extends StatefulWidget {
  @override
  _BachelorsMastersState createState() => _BachelorsMastersState();
}

class _BachelorsMastersState extends State<BachelorsMasters> {
  final List<Bachelor> bachelors = generateFakeBachelors();
  List<Bachelor> favoriteBachelors = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(favoriteBachelors, context),
      body: ListView.separated(
        itemCount: bachelors.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          final bachelor = bachelors[index];
          return BachelorPreview(
            bachelor: bachelor,
            isFavorite: favoriteBachelors.contains(bachelor),
            onFavoritePressed: () => toggleFavorite(bachelor),
            onFavoriteStatusChanged: (bachelor, isFavorite) =>
                toggleFavoriteStatus(bachelor, isFavorite),
          );
        },
      ),
    );
  }

  void toggleFavorite(Bachelor bachelor) {
    setState(() {
      if (favoriteBachelors.contains(bachelor)) {
        favoriteBachelors.remove(bachelor);
      } else {
        favoriteBachelors.add(bachelor);
      }
    });
  }

  void toggleFavoriteStatus(Bachelor bachelor, bool isFavorite) {
    setState(() {
      if (isFavorite) {
        favoriteBachelors.add(bachelor);
      } else {
        favoriteBachelors.remove(bachelor);
      }
    });
  }
}
