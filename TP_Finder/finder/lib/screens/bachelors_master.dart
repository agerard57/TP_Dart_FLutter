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
  List<Bachelor> likedBachelors = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(likedBachelors, context),
      body: ListView.separated(
        itemCount: bachelors.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          final bachelor = bachelors[index];
          return BachelorPreview(
            bachelor: bachelor,
            isLiked: likedBachelors.contains(bachelor),
            onLikePressed: () => toggleLike(bachelor),
            onLikeStatusChanged: (bachelor, isLiked) =>
                toggleLikeStatus(bachelor, isLiked),
          );
        },
      ),
    );
  }

  void toggleLike(Bachelor bachelor) {
    setState(() {
      if (likedBachelors.contains(bachelor)) {
        likedBachelors.remove(bachelor);
      } else {
        likedBachelors.add(bachelor);
      }
    });
  }

  void toggleLikeStatus(Bachelor bachelor, bool isLiked) {
    setState(() {
      if (isLiked) {
        likedBachelors.add(bachelor);
      } else {
        likedBachelors.remove(bachelor);
      }
    });
  }
}
