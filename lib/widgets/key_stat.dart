import 'package:flutter/material.dart';

class KeyStat extends StatelessWidget {
  KeyStat(
      {Key key,
      @required this.backgroundColor,
      @required this.caption,
      @required this.icon,
      @required this.number})
      : super(key: key);

  final num number;
  final IconData icon;
  final Color backgroundColor;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
          ),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(width: 8),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              number.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              caption,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
