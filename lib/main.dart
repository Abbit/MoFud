import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'utils/router.dart';
import 'constants/routes.dart';
import 'constants/theme.dart';
import 'cubits/categories_cubit.dart';
import 'repositories/dishes_repository.dart';
import 'utils/api_client.dart';
import 'utils/local_database_client.dart';
import 'utils/no_glow_scroll_behavior.dart';
import 'cubits/dishes_cubit.dart';
import 'models/dish_model.dart';

void main() async {
  final LocalDatabaseClient<Dish> localDatabaseClient =
      LocalDatabaseClient<Dish>('favoriteDishes', DishAdapter());
  await localDatabaseClient.init();

  final ApiClient apiClient = ApiClient();

  final DishesRepository dishesRepository =
      DishesRepository(localDatabaseClient, apiClient);

  final app = MultiBlocProvider(
    providers: [
      BlocProvider<DishesCubit>(
        create: (_) => DishesCubit(dishesRepository)..getAllDishes(),
      ),
      BlocProvider<CategoriesCubit>(
        create: (_) => CategoriesCubit()..getAllCategories(),
      ),
    ],
    child: MoFudApp(),
  );

  runApp(app);
}

class MoFudApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoFud',
      theme: appTheme,
      initialRoute: Routes.splashScreen,
      onGenerateRoute: Router.generateRoute,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: NoGlowBehavior(),
          child: child,
        );
      },
    );
  }
}
