import 'package:flutter/material.dart';

class Price extends StatelessWidget {
  Price({Key key, this.price}) : super(key: key);

  final double price;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${price.toStringAsFixed(2)}',
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 14,
        letterSpacing: 0.00001,
      ),
    );
  }
}
