import 'package:flutter/material.dart';
import 'package:mofud/models/dish_model.dart';
import 'package:mofud/widgets/background_image.dart';
import 'package:mofud/widgets/favorite_button.dart';
import 'package:mofud/widgets/rating.dart';

class FeaturedDishCard extends StatelessWidget {
  FeaturedDishCard({
    Key key,
    @required this.featured,
  }) : super(key: key);

  final Dish featured;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 170,
          height: 205,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColor.withOpacity(0.15),
                blurRadius: 10,
                spreadRadius: 3,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: BackgroundImage(
              imageUrl: featured.imageUrl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FavoriteButton(),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          featured.title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Text(
          featured.subtitle,
          style: TextStyle(fontSize: 14, color: Colors.black38),
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Rating(
              rating: featured.rating,
            ),
            const SizedBox(width: 4),
            Text(
              '(${featured.ratingsCount} ratings)',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        )
      ],
    );
  }
}
