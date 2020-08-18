import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mofud/constants/strings.dart';
import 'package:mofud/constants/styles.dart';
import 'package:mofud/cubits/dishes_cubit.dart';
import 'package:mofud/cubits/generic_state.dart';
import 'package:mofud/models/dish_model.dart';
import 'package:mofud/widgets/empty_page_template.dart';

class CartPage extends StatelessWidget {
  CartPage();

  Widget _buildEmptyPage() {
    return EmptyPageTemplate(
      title: AppStrings.cartPageEmptyTitle,
      subTitle: AppStrings.cartPageEmptySubTitle,
      imagePath: AppStrings.cartPageEmptyImagePath,
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            title: Text(
              AppStrings.cartPageAppBarTitle,
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

                return _buildEmptyPage();
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
