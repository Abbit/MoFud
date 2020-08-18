import 'package:mofud/models/dish_model.dart';
import 'package:mofud/utils/api_client.dart';
import 'package:mofud/utils/local_database_client.dart';

class DishesRepository {
  LocalDatabaseClient<Dish> _localDBClient;
  ApiClient _apiClient;

  DishesRepository(this._localDBClient, this._apiClient);

  Future<List<Dish>> getAllDishes() async {
    final response = await _apiClient.get('/dishes');

    final dishes = List<Dish>.from(response.data.map<Dish>((dishJson) {
      dishJson['price'] = double.parse(dishJson['price']);
      dishJson['rating'] = double.parse(dishJson['rating']);

      return Dish.fromJson(dishJson);
    }));

    return dishes;
  }

  Future<void> addDishToFavorite(Dish dish) async {
    _localDBClient.put(dish.id.toString(), dish);
  }

  Future<void> removeDishFromFavorite(Dish dish) async {
    _localDBClient.delete(dish.id.toString());
  }

  Future<bool> isDishInFavorite(Dish dish) async {
    final bool isInFavorite =
        await _localDBClient.isContains(dish.id.toString());

    return isInFavorite;
  }

  Future<List<Dish>> getAllFavoriteDishes() async {
    final List<Dish> favoriteDishList = await _localDBClient.getAll();

    return favoriteDishList;
  }
}
