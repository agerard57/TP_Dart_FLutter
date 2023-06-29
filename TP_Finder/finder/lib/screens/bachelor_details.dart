import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/bachelor_data_manager.dart';
import '../models/bachelor.dart';
import '../providers/provider.dart';
import '../widgets/favorite_button.dart';

class BachelorDetails extends StatefulWidget {
  final int id;

  BachelorDetails({
    required this.id,
  });

  @override
  _BachelorDetailsState createState() => _BachelorDetailsState();
}

class _BachelorDetailsState extends State<BachelorDetails> {
  late List<Bachelor> favoriteBachelors;
  late final Bachelor bachelor;
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    bachelor = BachelorDataManager().getBachelor(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final bachelorAppProvider = Provider.of<BachelorAppProvider>(context);

    favoriteBachelors = bachelorAppProvider.favoriteBachelors;

    isFavorite = favoriteBachelors.contains(bachelor);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${bachelor.firstName} ${bachelor.lastName}\'s details',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: bachelor.avatar,
              child: CircleAvatar(
                backgroundImage: AssetImage(bachelor.avatar),
                radius: 50,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '${bachelor.firstName} ${bachelor.lastName}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              bachelor.job ?? '',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Description:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                bachelor.description ?? '',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            FavoriteButton(
                isFavorite: isFavorite,
                onPressed: () =>
                    bachelorAppProvider.toggleFavorite(bachelor, context)),
          ],
        ),
      ),
    );
  }
}
