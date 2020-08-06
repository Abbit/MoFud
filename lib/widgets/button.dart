import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({Key key, this.onPressed, @required this.text}) : super(key: key);

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
