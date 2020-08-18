import 'package:flutter/material.dart';
import 'package:mofud/constants/colors.dart';
import 'package:mofud/constants/strings.dart';
import 'package:mofud/constants/styles.dart';
import 'package:mofud/widgets/search.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 8, bottom: 40, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.place,
                          color: AppColors.white,
                          size: 16,
                        ),
                        Text(
                          'Place: ',
                          style:
                              AppStyles.textLight.copyWith(color: AppColors.white),
                        ),
                        Text(
                          'ul. Gagarina',
                          style: AppStyles.heading1
                              .copyWith(color: AppColors.white),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.notifications_none,
                      color: AppColors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                const Text(
                  AppStrings.headerText,
                  style: AppStyles.headerTitle,
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -28,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Search(),
          ),
        ),
      ],
    );
  }
}
