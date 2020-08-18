import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mofud/constants/styles.dart';

class Button extends StatelessWidget {
  Button({Key key, @required this.text, this.onPressed, this.trailing})
      : super(key: key);

  final void Function() onPressed;
  final String text;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
      child: Row(
        mainAxisAlignment: trailing != null
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          Text(
            text.toUpperCase(),
            style: AppStyles.button,
          ),
          trailing ?? Container(),
        ],
      ),
    );
  }
}
