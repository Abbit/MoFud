import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mofud/constants/routes.dart';
import 'package:mofud/constants/strings.dart';
import 'package:mofud/constants/styles.dart';
import 'package:mofud/cubits/dishes_cubit.dart';
import 'package:mofud/cubits/generic_state.dart';
import 'package:mofud/models/dish_model.dart';
import 'package:mofud/screens/dish_screen.dart';
import 'package:mofud/widgets/dish_card.dart';
import 'package:mofud/widgets/empty_page_template.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage();

  Widget _buildDishGrid(List<FavoritableDish> dishList,
      void Function(Dish) toggleFavorite, void Function(Dish) onDishCardTap) {
    const double verticalPadding = 16.0;
    const double horizontalPadding = 16.0;
    const double itemsGap = 24.0;

    const double itemWidth = 150.0;
    const double itemHeight = 225.0;

    return GridView.count(
      padding: const EdgeInsets.symmetric(
          vertical: verticalPadding, horizontal: horizontalPadding),
      crossAxisCount: 2,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      childAspectRatio: (itemWidth / itemHeight),
      scrollDirection: Axis.vertical,
      crossAxisSpacing: itemsGap,
      mainAxisSpacing: itemsGap,
      children: List.generate(dishList.length, (index) {
        final dish = dishList[index].dish;
        final isFavorite = dishList[index].isFavorite;

        void onFavoriteButtonPressed() => toggleFavorite(dish);

        void onTap() => onDishCardTap(dish);

        return DishCard(
          dish: dish,
          isFavorite: isFavorite,
          onFavoriteButtonPressed: onFavoriteButtonPressed,
          onTap: onTap,
        );
      }),
    );
  }

  Widget _buildEmptyPage() {
    return EmptyPageTemplate(
      title: AppStrings.favoritesPageEmptyTitle,
      subTitle: AppStrings.favoritesPageEmptySubTitle,
      imagePath: AppStrings.favoritesPageEmptyImagePath,
    );
  }

  Widget _buildBody(BuildContext context) {
    void onDishCardTap(Dish dish) {
      Navigator.of(context)
          .pushNamed(Routes.dishScreen, arguments: DishScreenArgs(dish: dish));
    }

    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            title: Text(
              AppStrings.favoritesPageAppBarTitle,
              style: AppStyles.heading3,
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          BlocBuilder<DishesCubit, GenericState>(
            builder: (BuildContext context, state) {
              final dishesCubit = context.bloc<DishesCubit>();

              if (state is InProgress) {
                return Container(child: Text('loading'));
              }

              if (state is Failure) {
                debugPrint(state.message);
                return Container(child: Text('error'));
              }

              if (state is Success<DishesCubitState>) {
                final List<FavoritableDish> favoriteDishList = List.from(state
                    .data.favoritableDishList
                    .where((dish) => dish.isFavorite));

                final bool renderEmptyPage = favoriteDishList.length == 0;

                return renderEmptyPage
                    ? _buildEmptyPage()
                    : _buildDishGrid(favoriteDishList,
                        dishesCubit.toggleDishFavorite, onDishCardTap);
              }

              return Container(child: Text('lol'));
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }
}
