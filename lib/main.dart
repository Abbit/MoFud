import 'package:mofud/theme.dart';
import 'package:mofud/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:mofud/utils/no_glow_scroll_behavior.dart';

void main() => runApp(MoFudApp());

class MoFudApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoFud',
      theme: appTheme,
      home: HomeScreen(),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: NoGlowBehavior(),
          child: child,
        );
      },
    );
  }
}
