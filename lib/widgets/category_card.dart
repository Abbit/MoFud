import 'package:flutter/material.dart';
import 'package:mofud/models/category_model.dart';
import 'package:mofud/widgets/background_image.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({Key key, @required this.category}) : super(key: key);

  final Category category;

  static const _size = 56.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: CategoryCard._size,
          height: CategoryCard._size,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColor.withOpacity(0.15),
                blurRadius: 10,
                spreadRadius: 10,
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: BackgroundImage(imageUrl: category.imageUrl),
          ),
        ),
        const SizedBox(height: 4),
        Text(category.title)
      ],
    );
  }
}
