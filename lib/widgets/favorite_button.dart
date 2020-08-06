import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _isFavorite = false;

  _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: _toggleFavorite,
      shape: const CircleBorder(),
      fillColor: Colors.white,
      constraints: const BoxConstraints(maxWidth: 40, maxHeight: 40),
      padding: const EdgeInsets.all(6),
      child: Icon(
        _isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
