import 'package:mofud/models/category_model.dart';
import 'package:mofud/utils/api_client.dart';

class CategoriesRepository {
  final ApiClient _apiClient = ApiClient();

  Future<List<Category>> getAllCategories() async {
    final response = await _apiClient.get('/categories');

    final categories = List<Category>.from(response.data
        .map<Category>((categoryJson) => Category.fromJson(categoryJson)));

    return categories;
  }
}
