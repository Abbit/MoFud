import 'package:mofud/constants/api_endpoints.dart';
import 'package:mofud/constants/mocks.dart';
import 'package:mofud/models/category_model.dart';
import 'package:mofud/utils/api_client.dart';

class CategoriesRepository {
  final ApiClient _apiClient;

  CategoriesRepository(this._apiClient);

  Future<List<Category>> getAllCategories() async {
    final response = await _apiClient.get(AppApiEndpoints.getAllCategories);

    final categories = List<Category>.from(response.data
        .map<Category>((categoryJson) => Category.fromJson(categoryJson)));

    return categories;
  }
}

class CategoriesMockRepository extends CategoriesRepository {
  CategoriesMockRepository(ApiClient apiClient) : super(apiClient);

  @override
  Future<List<Category>> getAllCategories() async {
    final categories = AppMocks.categories;

    return categories;
  }
}
