import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'dish_model.g.dart';

@HiveType(typeId: 1)
class Dish extends Equatable {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final double price;

  @HiveField(2)
  final String imageUrl;

  @HiveField(3)
  final String subtitle;

  @HiveField(4)
  final double rating;

  @HiveField(5)
  final int ratingsCount;

  @HiveField(6)
  final int id;

  Dish({
    @required this.title,
    @required this.price,
    this.id,
    this.imageUrl,
    this.subtitle,
    this.rating,
    this.ratingsCount,
  });

  factory Dish.fromJson(Map<String, dynamic> json) => Dish(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        imageUrl: json['imageUrl'],
        subtitle: json['subtitle'] ?? '',
        rating: json['rating'],
        ratingsCount: json['ratingsCount'],
      );

  @override
  List<Object> get props =>
      [id, title, price, imageUrl, subtitle, rating, ratingsCount];

  @override
  String toString() {
    return '${this.runtimeType}(${this.title})';
  }
}

class FavoritableDish extends Equatable {
  final Dish dish;
  final bool isFavorite;

  FavoritableDish({
    @required this.dish,
    @required this.isFavorite,
  });

  @override
  List<Object> get props => [dish, isFavorite];
}
