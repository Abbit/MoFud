import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mofud/constants/colors.dart';
import 'package:mofud/constants/strings.dart';
import 'package:mofud/constants/styles.dart';
import 'package:mofud/cubits/orders_cubit.dart';
import 'package:mofud/models/dish_model.dart';
import 'package:mofud/models/order_item_model.dart';
import 'package:mofud/widgets/background_image.dart';
import 'package:mofud/widgets/button.dart';
import 'package:mofud/widgets/counter.dart';
import 'package:mofud/widgets/empty_page_template.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class OrderListItem extends StatelessWidget {
  OrderListItem(
      {Key key,
      @required this.orderItem,
      this.onDecrementQuantity,
      this.onDeleteItem,
      this.onIncrementQuantity})
      : super(key: key);

  final OrderItem orderItem;
  final Function onIncrementQuantity;
  final Function onDecrementQuantity;
  final Function onDeleteItem;

  @override
  Widget build(BuildContext context) {
    final Dish dish = orderItem.dish;
    final int quantity = orderItem.quantity;
    final double totalPrice = orderItem.totalPrice;

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.2,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColor.withOpacity(0.15),
                blurRadius: 7,
                spreadRadius: 5,
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: BackgroundImage(imageUrl: dish.imageUrl),
          ),
        ),
        title: Text(dish.title, style: AppStyles.heading1),
        subtitle: Container(
          padding: EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Counter(
                minValue: 1,
                value: quantity,
                onIncrement: onIncrementQuantity,
                onDecrement: onDecrementQuantity,
              ),
              Text(
                '\$${totalPrice.toStringAsFixed(2)}',
                style: AppStyles.heading2.copyWith(letterSpacing: -0.5),
              )
            ],
          ),
        ),
      ),
      secondaryActions: [
        SlideAction(
          color: AppColors.background,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.delete,
                  color: Theme.of(context).primaryColor,
                ),
                Text(
                  'Delete',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ],
            ),
          ),
          onTap: onDeleteItem,
        ),
      ],
    );
  }
}

class CartPage extends StatelessWidget {
  CartPage();

  Widget _buildEmptyPage() {
    return EmptyPageTemplate(
      title: AppStrings.cartPageEmptyTitle,
      subTitle: AppStrings.cartPageEmptySubTitle,
      imagePath: AppStrings.cartPageEmptyImagePath,
    );
  }

  void showOverlay(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: Center(
            child: Column(
              children: [
                Container(
                  child: Icon(
                    Icons.done,
                    color: AppColors.green,
                    size: 40,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2,
                      color: AppColors.green,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  AppStrings.cartPageModalTitle,
                  style: AppStyles.heading2,
                ),
              ],
            ),
          ),
          content: Text(
            AppStrings.cartPageModalSubTitle,
            textAlign: TextAlign.center,
            style: AppStyles.text,
          ),
          actions: [
            FlatButton(
              textColor: Theme.of(context).primaryColor,
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        final OrdersCubit ordersCubit = context.bloc<OrdersCubit>();

        final List<OrderItem> itemList = state.itemList;

        final isCartHaveItems = itemList.length > 0;

        void confirmOrder() async {
          ordersCubit.confirmOrder();

          showOverlay(context);
        }

        if (!isCartHaveItems) {
          return _buildEmptyPage();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: itemList.length,
                  itemBuilder: (_, index) {
                    final OrderItem item = itemList[index];

                    void deleteItem() {
                      ordersCubit.deleteItem(itemList[index]);
                    }

                    void incrementQuantity() {
                      ordersCubit.incrementItemQuantity(itemList[index]);
                    }

                    void decrementQuantity() {
                      ordersCubit.decrementOrderItemQuantity(itemList[index]);
                    }

                    return OrderListItem(
                      orderItem: item,
                      onDecrementQuantity: decrementQuantity,
                      onIncrementQuantity: incrementQuantity,
                      onDeleteItem: deleteItem,
                    );
                  }),
              SizedBox(height: 8),
              Divider(),
              SizedBox(height: 16),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Item Total',
                        style: AppStyles.text,
                      ),
                      Text(
                        '\$${state.totalPrice.toStringAsFixed(2)}',
                        style: AppStyles.heading1,
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Fee',
                        style: AppStyles.text,
                      ),
                      Text(
                        'FREE',
                        style: AppStyles.heading1.copyWith(
                            color: AppColors.green,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: AppStyles.heading5),
                  Text(
                    '\$${state.totalPrice.toStringAsFixed(2)}',
                    style: AppStyles.heading5.copyWith(
                        letterSpacing: -1.5, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.place,
                    size: 32,
                  ),
                  SizedBox(width: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Deliver at:',
                        style: AppStyles.heading1,
                      ),
                      Text(
                        'ul. Gagarina',
                        style: AppStyles.text,
                      ),
                    ],
                  ),
                  Spacer(),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      'change'.toUpperCase(),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Button(
                text: 'confirm order',
                trailing: Icon(
                  Icons.room_service,
                  color: AppColors.white,
                  size: 30,
                ),
                onPressed: confirmOrder,
              ),
              SizedBox(height: 32),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
            _buildBody(context),
          ],
        ),
      ),
    );
  }
}
