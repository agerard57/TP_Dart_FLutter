import 'package:flutter/material.dart';
import '../models/bachelor.dart';
import '../utils/snackbar_utils.dart';
import '../widgets/like_button.dart';

class DetailsScreen extends StatefulWidget {
  final Bachelor bachelor;
  final bool isLiked;
  final Function(Bachelor, bool) onLikeStatusChanged;

  DetailsScreen({
    required this.bachelor,
    required this.isLiked,
    required this.onLikeStatusChanged,
  });

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late bool isLiked;

  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked;
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
            LikeButton(
              isLiked: isLiked,
              onPressed: () {
                setState(() {
                  isLiked = !isLiked;
                });
                widget.onLikeStatusChanged(widget.bachelor, isLiked);
                showSnackBar(
                  context,
                  isLiked
                      ? 'You liked this bachelor!'
                      : 'You unliked this bachelor.',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
