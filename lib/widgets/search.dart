import 'package:flutter/material.dart';
import 'package:mofud/constants/colors.dart';
import 'package:mofud/constants/strings.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: MediaQuery.of(context).size.width - 32,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.3),
            blurRadius: 25,
            spreadRadius: 3,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        icon: const Icon(
                          Icons.search,
                          color: AppColors.lightGrey,
                          size: 26,
                        ),
                        hintText: AppStrings.headerSearchHintText,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Icon(
              Icons.filter_list,
              color: Theme.of(context).primaryColor,
              size: 36,
            ),
          ],
        ),
      ),
    );
  }
}
