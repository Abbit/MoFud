import 'package:flutter/material.dart';
import 'package:mofud/models/dish_model.dart';
import 'package:mofud/widgets/background_image.dart';
import 'package:mofud/widgets/favorite_button.dart';
import 'package:mofud/widgets/price.dart';
import 'package:mofud/widgets/rating.dart';

class DishCard extends StatelessWidget {
  DishCard({
    Key key,
    @required this.dish,
    @required this.isFavorite,
    this.onFavoriteButtonPressed,
    this.onTap,
  }) : super(key: key);

  final Dish dish;
  final bool isFavorite;
  final void Function() onFavoriteButtonPressed;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final double imageHeight = 150;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.15),
              blurRadius: 10,
              spreadRadius: 3,
              offset: const Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(children: [
          Container(
            height: imageHeight,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
              child: BackgroundImage(
                imageUrl: dish.imageUrl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FavoriteButton(
                      isFavorite: isFavorite,
                      onPressed: onFavoriteButtonPressed,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 12, left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(dish.title,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                        dish.subtitle,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Rating(
                        rating: dish.rating,
                      ),
                      const SizedBox(width: 8),
                      Price(price: dish.price,),
                    ],
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
