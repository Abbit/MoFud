import 'package:flutter/material.dart';

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

    return Container(
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey.withOpacity(0.5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.remove,
              size: 18,
            ),
            color: Theme.of(context).primaryColor,
            onPressed: isMin ? null : onDecrement,
          ),
          Text(
            '$value',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              size: 18,
            ),
            color: Theme.of(context).primaryColor,
            onPressed: isMax ? null : onIncrement,
          ),
        ],
      ),
    );
  }
}
