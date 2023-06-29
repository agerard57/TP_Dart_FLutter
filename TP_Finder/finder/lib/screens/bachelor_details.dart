import 'package:flutter/material.dart';
import '../models/bachelor.dart';
import '../utils/snackbar_utils.dart';
import '../widgets/favorite_button.dart';

class BachelorDetails extends StatefulWidget {
  final Bachelor bachelor;
  final bool isFavorite;
  final Function(Bachelor, bool) onFavoriteStatusChanged;

  BachelorDetails({
    required this.bachelor,
    required this.isFavorite,
    required this.onFavoriteStatusChanged,
  });

  @override
  _BachelorDetailsState createState() => _BachelorDetailsState();
}

class _BachelorDetailsState extends State<BachelorDetails> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.bachelor.firstName} ${widget.bachelor.lastName}\'s details',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: widget.bachelor.avatar,
              child: CircleAvatar(
                backgroundImage: AssetImage(widget.bachelor.avatar),
                radius: 50,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '${widget.bachelor.firstName} ${widget.bachelor.lastName}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              widget.bachelor.job ?? '',
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
                widget.bachelor.description ?? '',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            FavoriteButton(
              isFavorite: isFavorite,
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
                widget.onFavoriteStatusChanged(widget.bachelor, isFavorite);
                showSnackBar(
                  context,
                  isFavorite
                      ? 'You favorite this bachelor!'
                      : 'You unfavorite this bachelor.',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
