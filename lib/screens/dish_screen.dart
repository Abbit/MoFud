import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mofud/constants/colors.dart';
import 'package:mofud/constants/styles.dart';
import 'package:mofud/cubits/dishes_cubit.dart';
import 'package:mofud/cubits/generic_state.dart';
import 'package:mofud/cubits/orders_cubit.dart';
import 'package:mofud/models/dish_model.dart';
import 'package:mofud/models/order_item_model.dart';
import 'package:mofud/widgets/button.dart';
import 'package:mofud/widgets/counter.dart';
import 'package:mofud/widgets/favorite_button.dart';
import 'package:mofud/widgets/key_stat.dart';
import 'package:mofud/widgets/price.dart';

class DishScreenArgs {
  final Dish dish;

  DishScreenArgs({@required this.dish});
}

class DishExtra {
  final double price;
  final String title;

  DishExtra({@required this.price, @required this.title});
}

class DishScreenSectionTitle extends StatelessWidget {
  DishScreenSectionTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.black,
            width: 1,
          ),
        ),
      ),
      child: Text(
        title.toUpperCase(),
        style: AppStyles.heading1,
      ),
    );
  }
}

class DishScreen extends StatefulWidget {
  DishScreen({@required this.dish});

  final Dish dish;

  @override
  _DishScreenState createState() => _DishScreenState();
}

class _DishScreenState extends State<DishScreen> {
  final String dishDetails =
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).";

  int _quantity = 1;
  double _extraPrice = 0.0;

  List<DishExtra> _extrasList = [];

  @override
  void initState() {
    super.initState();

    _extrasList.add(DishExtra(price: 0.0, title: 'None'));
  }

  Widget _buildImagePlaceholder() {
    return Container(
      color: AppColors.primary,
    );
  }

  void _onExtraPressed(double value) {
    setState(() {
      _extraPrice = value;
    });
  }

  void _onQuantityIncrement() {
    setState(() {
      _quantity += 1;
    });
  }

  void _onQuantityDecrement() {
    setState(() {
      _quantity -= 1;
    });
  }

  Widget _buildExtrasList() {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(0),
        itemCount: _extrasList.length,
        separatorBuilder: (_, __) => Divider(color: AppColors.lightGrey),
        itemBuilder: (_, index) {
          final String title = _extrasList[index].title;
          final double price = _extrasList[index].price;

          return ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Row(
              children: [
                Text(
                  title,
                  style: AppStyles.heading1,
                ),
                Text(
                  ' + \$${price.toStringAsFixed(2)}',
                  style: AppStyles.caption2,
                ),
              ],
            ),
            trailing: Transform.scale(
              scale: 1.2,
              child: Radio(
                activeColor: Theme.of(context).primaryColor,
                value: price,
                groupValue: _extraPrice,
                onChanged: _onExtraPressed,
              ),
            ),
          );
        });
  }

  Widget _buildBody(BuildContext context) {
    final Dish dish = widget.dish;

    final double imageHeight = 300;
    final double totalPrice = dish.price * _quantity + _extraPrice;

    return Stack(
      children: [
        SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Stack(
            children: [
              Container(
                height: imageHeight,
                width: double.infinity,
                child: dish.imageUrl != null && dish.imageUrl.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: dish.imageUrl,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    AppColors.black.withOpacity(0.35),
                                    BlendMode.srcOver)),
                          ),
                        ),
                        placeholder: (context, url) => _buildImagePlaceholder(),
                        errorWidget: (context, url, error) {
                          debugPrint(error.toString());

                          return Container(color: AppColors.primary);
                        },
                      )
                    : _buildImagePlaceholder(),
              ),
              Column(
                children: [
                  AppBar(
                    iconTheme: const IconThemeData(color: AppColors.white),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  SizedBox(height: imageHeight - 160),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BlocBuilder<DishesCubit, GenericState>(
                        builder: (context, state) {
                          final DishesCubit dishesCubit =
                              context.bloc<DishesCubit>();

                          void onFavPressed() =>
                              dishesCubit.toggleDishFavorite(dish);

                          final Future<bool> isFavoriteFuture =
                              dishesCubit.isDishInFavorite(dish);

                          return FutureBuilder(
                            future: isFavoriteFuture,
                            builder: (BuildContext context,
                                AsyncSnapshot<bool> snapshot) {
                              if (snapshot.hasData) {
                                final bool isFavorite = snapshot.data;

                                return FavoriteButton(
                                  isFavorite: isFavorite,
                                  onPressed: onFavPressed,
                                );
                              }

                              return FavoriteButton(
                                isFavorite: false,
                                onPressed: () {},
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(width: 16),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(32)),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${dish.title}',
                                style: AppStyles.heading2,
                              ),
                              Price(
                                price: dish.price,
                              ),
                            ],
                          ),
                          SizedBox(height: 32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              KeyStat(
                                caption: 'Rating',
                                number: dish.rating,
                                backgroundColor: AppColors.yellow,
                                icon: Icons.star,
                              ),
                              KeyStat(
                                caption: 'Favorites',
                                number: 255,
                                backgroundColor: Theme.of(context).primaryColor,
                                icon: Icons.favorite,
                              ),
                            ],
                          ),
                          SizedBox(height: 32),
                          DishScreenSectionTitle('Details'),
                          SizedBox(height: 16),
                          Text(
                            dishDetails,
                            style: AppStyles.text,
                          ),
                          SizedBox(height: 40),
                          DishScreenSectionTitle('Extras'),
                          SizedBox(height: 24),
                          _buildExtrasList(),
                          Divider(color: AppColors.lightGrey),
                          SizedBox(height: 24),
                          DishScreenSectionTitle('Quantity'),
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '$_quantity item${_quantity > 1 ? 's' : ''}',
                                style: AppStyles.textGrey,
                              ),
                              Counter(
                                value: _quantity,
                                minValue: 1,
                                onDecrement: _onQuantityDecrement,
                                onIncrement: _onQuantityIncrement,
                              ),
                            ],
                          ),
                          SizedBox(height: 80),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Theme.of(context)
                      .scaffoldBackgroundColor
                      .withOpacity(0.85),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 30),
                )
              ]),
              padding: EdgeInsets.only(left: 40, right: 40, bottom: 20),
              child: BlocBuilder<OrdersCubit, OrdersState>(
                  builder: (context, state) {
                final OrdersCubit ordersCubit = context.bloc<OrdersCubit>();

                void addToCart() {
                  final OrderItem item = OrderItem(dish, _quantity);

                  ordersCubit.addItem(item);

                  Navigator.of(context).pop();
                }

                return Button(
                  text: 'add to cart',
                  onPressed: addToCart,
                  trailing: Text(
                    '\$${totalPrice.toStringAsFixed(2)}',
                    style: AppStyles.button.copyWith(
                      letterSpacing: -0.5,
                    ),
                  ),
                );
              })),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }
}
