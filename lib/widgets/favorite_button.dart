import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  FavoriteButton({Key key, @required this.isFavorite, this.onPressed})
      : super(key: key);

  final bool isFavorite;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: const CircleBorder(),
      fillColor: Colors.white,
      constraints: const BoxConstraints(maxWidth: 40, maxHeight: 40),
      padding: const EdgeInsets.all(6),
      child: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
