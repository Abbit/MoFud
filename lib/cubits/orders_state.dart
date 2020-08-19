part of 'orders_cubit.dart';

class OrdersState extends Equatable {
  final List<OrderItem> itemList;

  OrdersState({
    this.itemList = const [],
  });

  double get totalPrice {
    double total = 0;

    for (final orderItem in itemList) {
      total += orderItem.totalPrice;
    }

    return total;
  }

  @override
  List<Object> get props => [itemList, totalPrice];
}
