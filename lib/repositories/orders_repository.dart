import 'package:mofud/models/order_item_model.dart';
import 'package:mofud/utils/api_client.dart';
import 'package:mofud/utils/local_database_client.dart';

class OrdersRepository {
  LocalDatabaseClient<OrderItem> _localDBClient;
  ApiClient _apiClient;

  OrdersRepository(this._localDBClient, this._apiClient);

  Future<List<OrderItem>> getAllOrderItems() async {
    final List<OrderItem> favoriteDishList = await _localDBClient.getAll();

    return favoriteDishList;
  }

  Future<void> addOrderItem(OrderItem item) async {
    await _localDBClient.put(item.dish.id.toString(), item);
  }

  Future<void> removeOrderItem(OrderItem item) async {
    await _localDBClient.delete(item.dish.id.toString());
  }

  Future<void> updateOrderItem(OrderItem item) async {
    await _localDBClient.update(item.dish.id.toString(), item);
  }

  Future<void> removeAllOrderItems() async {
    await _localDBClient.deleteAll();
  }

  Future<void> sendOrder(List<OrderItem> itemList) async {
    var data = [];

    for (final orderItem in itemList) {
      data.add({"dishId": orderItem.dish.id, "quantity": orderItem.quantity});
    }

    await _apiClient.post('/orders/accept', data: data);
  }
}

class OrdersMockRepository extends OrdersRepository {
  OrdersMockRepository(
      LocalDatabaseClient<OrderItem> localDBClient, ApiClient apiClient)
      : super(localDBClient, apiClient);

  @override
  Future<void> sendOrder(List<OrderItem> itemList) async {}
}
