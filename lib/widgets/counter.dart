import 'package:flutter/material.dart';
import 'package:mofud/constants/styles.dart';

class Counter extends StatelessWidget {
  Counter(
      {Key key,
      @required this.value,
      this.minValue,
      this.maxValue,
      this.onDecrement,
      this.onIncrement})
      : super(key: key);

  final int value;
  final int minValue;
  final int maxValue;
  final Function onIncrement;
  final Function onDecrement;

  @override
  Widget build(BuildContext context) {
    final bool isMin = minValue != null && value == minValue;
    final bool isMax = maxValue != null && value == maxValue;

    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      width: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.remove,
              size: 18,
            ),
            color: primaryColor,
            onPressed: isMin ? null : onDecrement,
          ),
          Text(
            '$value',
            style: AppStyles.heading1.copyWith(color: primaryColor),
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              size: 18,
            ),
            color: primaryColor,
            onPressed: isMax ? null : onIncrement,
          ),
        ],
      ),
    );
  }
}
