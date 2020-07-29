import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'utils/hexcolor.dart';

void main() => runApp(MoFudApp());

class MoFudApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoFud',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
        ),
        scaffoldBackgroundColor: HexColor.fromHex("#fafafa"),
        primaryColor: HexColor.fromHex("#fafafa"),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
