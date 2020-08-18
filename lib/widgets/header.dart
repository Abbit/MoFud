import 'package:flutter/material.dart';
import 'package:mofud/constants/strings.dart';
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
            padding: const EdgeInsets.only(top: 8, bottom: 40, left: 16, right: 16),
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
                          color: Colors.white,
                          size: 16,
                        ),
                        const Text(
                          'Place: ',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          'ul. Gagarina',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                const Text(
                  AppStrings.headerText,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 32),
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
