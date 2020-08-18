import 'package:flutter/material.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:mofud/constants/strings.dart';
import 'package:mofud/screens/cart_page.dart';
import 'package:mofud/screens/explore_page.dart';
import 'package:mofud/screens/favorites_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;

  List<Widget> _children = [ExplorePage(), FavoritesPage(), CartPage()];

  void onTabTapped(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentPageIndex,
      type: BottomNavigationBarType.fixed,
      onTap: onTabTapped,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.explore),
          title: const Text(AppStrings.homeBottomNavigationTitle),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite),
          title: const Text(AppStrings.favoriteBottomNavigationTitle),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.shopping_basket),
          title: const Text(AppStrings.cartBottomNavigationTitle),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: _currentPageIndex == 0 ? Theme.of(context).primaryColor : Theme.of(context).scaffoldBackgroundColor,
      child: Scaffold(
        body: IndexedStack(
          children: _children,
          index: _currentPageIndex,
        ),
        bottomNavigationBar: _buildBottomNavBar(),
      ),
    );
  }
}
