import 'package:flutter/material.dart';
import 'package:mofud/constants/colors.dart';

class AppStyles {
  AppStyles._();

  // Headings

  static const heading1 = TextStyle(
    color: AppColors.black,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  static const heading2 = TextStyle(
    color: AppColors.black,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const heading3 = TextStyle(
    color: AppColors.black,
    fontSize: 24,
  );
  static const heading4 = TextStyle(
    color: AppColors.black,
    fontSize: 26,
    fontWeight: FontWeight.bold,
  );

  static const heading5 = TextStyle(
    color: AppColors.black,
    fontSize: 32,
    fontWeight: FontWeight.w500,
  );

  // Body

  static const text = TextStyle(
    color: AppColors.grey,
    fontSize: 14,
  );

  static final textLight = text.copyWith(
    color: AppColors.lightGrey,
    fontWeight: FontWeight.w300,
  );

  static const textGrey = TextStyle(
    color: AppColors.lightGrey,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  // Captions

  static const caption1 = TextStyle(
    color: AppColors.lightGrey,
    fontSize: 12,
  );

  static const caption2 = TextStyle(
    color: AppColors.lightGrey,
    fontSize: 14,
  );

  // Misc

  static const numbers = TextStyle(
    color: AppColors.black,
    fontSize: 14,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.8,
  );

  static const button = TextStyle(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}
