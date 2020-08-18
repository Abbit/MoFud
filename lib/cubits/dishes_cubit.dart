import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mofud/cubits/generic_state.dart';
import 'package:mofud/models/dish_model.dart';
import 'package:mofud/repositories/dishes_repository.dart';
import 'package:mofud/utils/connection_checker.dart';

class DishesCubitState extends Equatable {
  final List<FavoritableDish> favoritableDishList;

  DishesCubitState(this.favoritableDishList);

  @override
  List<Object> get props => [favoritableDishList];
}

class DishesCubit extends Cubit<GenericState> with ConnectionChecker {
  final DishesRepository _dishesRepository;

  DishesCubit(this._dishesRepository) : super(Initial());

  Future<DishesCubitState> _createNewState() async {
    final List<Dish> dishList = await _dishesRepository.getAllDishes();

    final List<FavoritableDish> favoritableDishList = await Future.wait(
        dishList.map((dish) async => FavoritableDish(
            dish: dish,
            isFavorite: await _dishesRepository.isDishInFavorite(dish))));

    final DishesCubitState dishesCubitState =
        DishesCubitState(favoritableDishList);

    return dishesCubitState;
  }

  Future<void> getAllDishes() async {
    try {
      if (!await isConnected()) {
        emit(Failure());
        return;
      }

      emit(InProgress());

      DishesCubitState dishesCubitState = await _createNewState();

      emit(Success<DishesCubitState>(dishesCubitState));
    } catch (e) {
      emit(Failure(e.toString()));
    }
  }

  Future<void> addDishToFavorite(Dish dish) async {
    await _dishesRepository.addDishToFavorite(dish);

    DishesCubitState dishesCubitState = await _createNewState();

    emit(Success<DishesCubitState>(dishesCubitState));
  }

  Future<void> removeDishFromFavorite(Dish dish) async {
    await _dishesRepository.removeDishFromFavorite(dish);

    if (state is Success<DishesCubitState>) {
      DishesCubitState dishesCubitState = await _createNewState();

      emit(Success<DishesCubitState>(dishesCubitState));
    }
  }

  Future<bool> isDishInFavorite(Dish dish) async {
    final bool isInFavorite = await _dishesRepository.isDishInFavorite(dish);

    return isInFavorite;
  }

  Future<void> toggleDishFavorite(Dish dish) async {
    final bool isInFavorite = await isDishInFavorite(dish);

    if (isInFavorite) {
      await removeDishFromFavorite(dish);
    } else {
      await addDishToFavorite(dish);
    }
  }
}
