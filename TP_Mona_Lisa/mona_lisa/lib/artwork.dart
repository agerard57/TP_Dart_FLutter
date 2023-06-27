import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Artwork extends StatefulWidget {
  @override
  _ArtworkState createState() => _ArtworkState();
}

class _ArtworkState extends State<Artwork> {
  bool _isFavorite = false;
  bool _showDescription = false;
  String _appBarText = '';
  String _artworkName = '';
  String _artistName = '';
  String _imageAsset = '';
  String _artworkDescription = '';
  String _favoriteMessage = '';

  void toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  void toggleDescription() {
    setState(() {
      _showDescription = !_showDescription;
    });
  }

  @override
  void initState() {
    super.initState();
    loadArtworkData();
  }

  Future<void> loadArtworkData() async {
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString('data/artwork_data.json');
    Map<String, dynamic> jsonData = jsonDecode(jsonString);
    setState(() {
      _appBarText = jsonData['appBar'];
      _artworkName = jsonData['name'];
      _artistName = jsonData['artist'];
      _imageAsset = jsonData['imageAsset'];
      _artworkDescription = jsonData['description'];
      _favoriteMessage = jsonData['favorite'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarText),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  _imageAsset,
                  width: screenWidth,
                  height: screenHeight * 0.6,
                  fit: BoxFit.cover,
                ),
                Opacity(
                  opacity: _isFavorite ? 1.0 : 0.75,
                  child: Icon(
                    Icons.favorite,
                    size: 100,
                    color: _isFavorite ? Colors.red : Colors.white,
                  ),
                ),
                if (_showDescription)
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.7),
                      padding: EdgeInsets.all(16),
                      child: SingleChildScrollView(
                        child: Text(
                          _artworkDescription,
                          style: TextStyle(
                            fontFamily: 'Merriweather',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              child: Text(
                _artworkName,
                style: TextStyle(
                  fontFamily: 'Merriweather',
                  fontSize: 30,
                  color: Colors.brown,
                ),
              ),
            ),
            SizedBox(height: 8),
            Container(
              alignment: Alignment.center,
              child: Text(
                _artistName,
                style: TextStyle(
                  fontFamily: 'Merriweather',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.article),
                  onPressed: toggleDescription,
                ),
                IconButton(
                  icon: Icon(Icons.favorite),
                  color: _isFavorite ? Colors.red : Colors.brown,
                  onPressed: () {
                    toggleFavorite();
                    if (_isFavorite) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(_favoriteMessage),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
