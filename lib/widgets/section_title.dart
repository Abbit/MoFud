import 'package:flutter/material.dart';
import 'package:mofud/constants/styles.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle(this.title, {Key key})
      : assert(title != null),
        super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        this.title,
        style: AppStyles.heading3,
      ),
    );
  }
}
