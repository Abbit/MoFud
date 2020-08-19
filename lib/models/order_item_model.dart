import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:mofud/models/dish_model.dart';

part 'order_item_model.g.dart';

@HiveType(typeId: 2)
class OrderItem extends Equatable {
  @HiveField(0)
  final Dish dish;

  @HiveField(1)
  final int quantity;

  OrderItem(this.dish, this.quantity);

  double get totalPrice => dish.price * quantity;

  @override
  List<Object> get props => [dish, quantity, totalPrice];

  @override
  String toString() {
    return '${this.runtimeType}(${this.dish.title})';
  }
}
