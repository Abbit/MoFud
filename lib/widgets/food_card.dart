import 'package:flutter/material.dart';
import 'package:mofud/models/food_model.dart';
import 'package:mofud/widgets/background_image.dart';
import 'package:mofud/widgets/favorite_button.dart';

class FoodCard extends StatelessWidget {
  FoodCard({Key key, @required this.food}) : super(key: key);

  final Food food;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          height: 120,
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
            child: BackgroundImage(
              imageUrl: food.imageUrl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FavoriteButton(),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(food.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      food.shop,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${food.price.toString()}',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ButtonTheme(
                      buttonColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      minWidth: 64,
                      textTheme: ButtonTextTheme.primary,
                      child: OutlineButton(
                        child: const Text('Add'),
                        onPressed: () {},
                        highlightedBorderColor: Theme.of(context).primaryColor,
                        borderSide: const BorderSide(color: Colors.grey),
                        textColor: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
