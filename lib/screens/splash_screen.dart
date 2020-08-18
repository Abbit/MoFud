import 'package:flutter/material.dart';
import 'package:mofud/constants/colors.dart';
import 'package:mofud/constants/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<void> loadData() async {
    // TODO: change for load real data
    Future.delayed(Duration(seconds: 3), onDoneLoading);
  }

  void onDoneLoading() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Routes.homeScreen, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.primary),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(AppColors.white),
        ),
      ),
    );
  }
}
