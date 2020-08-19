import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'category_model.g.dart';

@HiveType(typeId: 0)
class Category extends Equatable {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String imageUrl;

  Category({
    @required this.title,
    @required this.imageUrl,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        title: json['title'],
        imageUrl: json['imageUrl'],
      );

  @override
  List<Object> get props => [title, imageUrl];

  @override
  String toString() {
    return '${this.runtimeType}(${this.title})';
  }
}
