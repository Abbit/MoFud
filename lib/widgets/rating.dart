import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  Rating({Key key, this.rating}) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 18,
        ),
        Text(
          rating.toString(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.00001,
          ),
        ),
      ],
    );
  }
}
