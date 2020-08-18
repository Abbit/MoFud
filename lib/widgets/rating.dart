import 'package:flutter/material.dart';
import 'package:mofud/constants/colors.dart';
import 'package:mofud/constants/styles.dart';

class Rating extends StatelessWidget {
  Rating({Key key, this.rating}) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: AppColors.yellow,
          size: 18,
        ),
        Text(
          rating.toString(),
          style: AppStyles.numbers,
        ),
      ],
    );
  }
}
