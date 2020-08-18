import 'package:flutter/material.dart';
import 'package:mofud/constants/styles.dart';

class Price extends StatelessWidget {
  Price({Key key, this.price}) : super(key: key);

  final double price;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${price.toStringAsFixed(2)}',
      style: AppStyles.numbers.copyWith(color: Theme.of(context).primaryColor),
    );
  }
}
