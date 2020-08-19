import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mofud/models/order_item_model.dart';
import 'package:mofud/repositories/orders_repository.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepository _ordersRepository;

  OrdersCubit(this._ordersRepository) : super(OrdersState());

  Future<OrdersState> _createNewState() async {
    final List<OrderItem> itemList = await _ordersRepository.getAllOrderItems();

    final OrdersState ordersState = OrdersState(itemList: itemList);

    return ordersState;
  }

  Future<void> getAllItems() async {
    emit(await _createNewState());
  }

  Future<void> deleteItem(OrderItem item) async {
    await _ordersRepository.removeOrderItem(item);

    emit(await _createNewState());
  }

  Future<void> addItem(OrderItem item) async {
    await _ordersRepository.addOrderItem(item);

    emit(await _createNewState());
  }

  Future<void> changeItemQuantity(OrderItem item, int value) async {
    final OrderItem newItem = OrderItem(item.dish, item.quantity + value);

    await _ordersRepository.updateOrderItem(newItem);

    emit(await _createNewState());
  }

  Future<void> incrementItemQuantity(OrderItem item) async {
    await changeItemQuantity(item, 1);
  }

  Future<void> decrementOrderItemQuantity(OrderItem item) async {
    await changeItemQuantity(item, -1);
  }

  Future<void> confirmOrder() async {
    List<OrderItem> orderItemList = state.itemList;

    await _ordersRepository.sendOrder(orderItemList);

    await _ordersRepository.removeAllOrderItems();

    emit(await _createNewState());
  }
}
