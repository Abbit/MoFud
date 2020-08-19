import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mofud/cubits/orders_cubit.dart';
import 'package:mofud/models/order_item_model.dart';
import 'package:mofud/repositories/categories_repository.dart';
import 'package:mofud/repositories/orders_repository.dart';
import 'package:mofud/utils/router.dart';
import 'package:mofud/constants/routes.dart';
import 'package:mofud/constants/theme.dart';
import 'package:mofud/cubits/categories_cubit.dart';
import 'package:mofud/repositories/dishes_repository.dart';
import 'package:mofud/utils/api_client.dart';
import 'package:mofud/utils/local_database_client.dart';
import 'package:mofud/utils/no_glow_scroll_behavior.dart';
import 'package:mofud/cubits/dishes_cubit.dart';
import 'package:mofud/models/dish_model.dart';

void main() async {
  await Hive.initFlutter();

  final LocalDatabaseClient<Dish> dishesLocalDatabaseClient =
      LocalDatabaseClient<Dish>('favoriteDishes', DishAdapter());
  await dishesLocalDatabaseClient.init();

  final LocalDatabaseClient<OrderItem> ordersLocalDatabaseClient =
      LocalDatabaseClient<OrderItem>('cart', OrderItemAdapter());
  await ordersLocalDatabaseClient.init();

  final ApiClient apiClient = ApiClient();

  final CategoriesRepository categoriesRepository =
      CategoriesRepository(apiClient);

  final DishesRepository dishesRepository =
      DishesRepository(dishesLocalDatabaseClient, apiClient);

  final OrdersRepository ordersRepository =
      OrdersRepository(ordersLocalDatabaseClient, apiClient);

  final app = MultiBlocProvider(
    providers: [
      BlocProvider<DishesCubit>(
        create: (_) => DishesCubit(dishesRepository)..getAllDishes(),
      ),
      BlocProvider<CategoriesCubit>(
        create: (_) =>
            CategoriesCubit(categoriesRepository)..getAllCategories(),
      ),
      BlocProvider<OrdersCubit>(
        create: (_) => OrdersCubit(ordersRepository)..getAllItems(),
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
      debugShowCheckedModeBanner: false,
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
