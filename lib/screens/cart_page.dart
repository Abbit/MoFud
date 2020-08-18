import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  CartPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          child: Center(
            child: Text('Cart'),
          ),
        ),
      ),
    );
  }
}
