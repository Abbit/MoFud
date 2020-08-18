import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mofud/constants/routes.dart';
import 'package:mofud/constants/strings.dart';
import 'package:mofud/cubits/categories_cubit.dart';
import 'package:mofud/cubits/dishes_cubit.dart';
import 'package:mofud/cubits/generic_state.dart';
import 'package:mofud/models/category_model.dart';
import 'package:mofud/models/dish_model.dart';
import 'package:mofud/widgets/category_card.dart';
import 'package:mofud/widgets/featured_dish_card.dart';
import 'package:mofud/widgets/dish_card.dart';
import 'package:mofud/widgets/header.dart';
import 'package:mofud/widgets/section_title.dart';

import 'dish_screen.dart';

class ExplorePage extends StatelessWidget {
  Widget _buildFeaturedList(List<Dish> featuredDishList) {
    const double listHeight = 301.0;
    const double topPadding = 8.0;
    const double horizontalPadding = 16.0;
    const double itemsGap = 16.0;

    return Container(
      height: listHeight,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(
            top: topPadding, left: horizontalPadding, right: horizontalPadding),
        itemCount: featuredDishList.length,
        itemBuilder: (context, index) =>
            FeaturedDishCard(featured: featuredDishList[index]),
        separatorBuilder: (context, index) => const SizedBox(width: itemsGap),
      ),
    );
  }

  Widget _buildCategoryList(List<Category> categoryList) {
    const double listHeight = 110.0;
    const double topPadding = 32.0;
    const double horizontalPadding = 16.0;
    const double itemsGap = 32.0;

    return Container(
      height: listHeight,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(
            top: topPadding, left: horizontalPadding, right: horizontalPadding),
        itemCount: categoryList.length,
        itemBuilder: (context, index) =>
            CategoryCard(category: categoryList[index]),
        separatorBuilder: (context, index) => const SizedBox(width: itemsGap),
      ),
    );
  }

  Widget _buildDishGrid(List<FavoritableDish> dishList,
      void Function(Dish) toggleFavorite, void Function(Dish) onDishCardTap) {
    const double verticalPadding = 8.0;
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

  @override
  Widget build(BuildContext context) {
    void onDishCardTap(Dish dish) {
      Navigator.of(context)
          .pushNamed(Routes.dishScreen, arguments: DishScreenArgs(dish: dish));
    }

    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(),
          const SizedBox(height: 40),
//            const SectionTitle(AppStrings.featuredSectionTitle),
//            _buildFeaturedList([]),
          BlocBuilder<CategoriesCubit, GenericState>(
            builder: (BuildContext context, state) {
              if (state is InProgress) {
                return Container(child: Text('loading'));
              }

              if (state is Failure) {
                debugPrint(state.message);
                return Container(child: Text('error'));
              }

              if (state is Success<List<Category>>) {
                return _buildCategoryList(state.data);
              }

              return Container(child: Text('lol'));
            },
          ),
          const SizedBox(height: 24),
          const SectionTitle(AppStrings.gridSectionTitle),
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
                return _buildDishGrid(
                    state.data.favoritableDishList,
                    dishesCubit.toggleDishFavorite,
                    onDishCardTap);
              }

              return Container(child: Text('lol'));
            },
          ),
        ],
      ),
    );
  }
}
