import 'package:flutter/material.dart';
import 'package:mofud/constants/styles.dart';

class EmptyPageTemplate extends StatelessWidget {
  EmptyPageTemplate({Key key, this.title, this.subTitle, this.imagePath})
      : super(key: key);

  final String title;
  final String subTitle;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final double contentHeight = MediaQuery.of(context).size.height - 200;

    return Container(
      height: contentHeight,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 250,
            ),
            SizedBox(height: 32),
            Text(
              title,
              style: AppStyles.heading4,
            ),
            SizedBox(height: 8),
            Container(
              width: 200,
              child: Text(
                subTitle,
                style: AppStyles.textLight,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
