import 'package:flutter/material.dart';
import 'package:mofud/models/food_model.dart';
import 'package:mofud/widgets/background_image.dart';
import 'package:mofud/widgets/favorite_button.dart';

class FeaturedFoodCard extends StatelessWidget {
  FeaturedFoodCard({
    Key key,
    @required this.featured,
  }) : super(key: key);

  final Food featured;

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
          featured.shop,
          style: TextStyle(fontSize: 14, color: Colors.black38),
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 18,
            ),
            Text(
              featured.rating.toString(),
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
