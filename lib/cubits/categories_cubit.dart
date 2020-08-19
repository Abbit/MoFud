import 'package:bloc/bloc.dart';
import 'package:mofud/cubits/generic_state.dart';
import 'package:mofud/models/category_model.dart';
import 'package:mofud/repositories/categories_repository.dart';
import 'package:mofud/utils/connection_checker.dart';

class CategoriesCubit extends Cubit<GenericState> with ConnectionChecker {
  final CategoriesRepository _categoriesRepository;

  CategoriesCubit(this._categoriesRepository) : super(Initial());

  void getAllCategories() async {
    try {
      if (!await isConnected()) {
        emit(Failure());
        return;
      }

      emit(InProgress());

      final List<Category> categories =
          await _categoriesRepository.getAllCategories();

      emit(Success<List<Category>>(categories));
    } catch (e) {
      emit(Failure(e.toString()));
    }
  }
}
