import 'package:flutter/material.dart';
import 'package:mofud/mocks.dart';
import 'package:mofud/models/food_model.dart';
import 'package:mofud/models/category_model.dart';
import 'package:mofud/widgets/category_card.dart';
import 'package:mofud/widgets/featured_food_card.dart';
import 'package:mofud/widgets/food_card.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:mofud/widgets/header.dart';
import 'package:mofud/widgets/section_title.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Food> _foodList = foodList;

  final List<Food> _featured = featuredFood;

  final List<Category> _categories = foodCategories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorfulSafeArea(
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              const SizedBox(height: 40),
              const SectionTitle('Featured'),
              Container(
                height: 301,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                  itemCount: _featured.length,
                  itemBuilder: (context, index) => FeaturedFoodCard(
                    featured: _featured[index],
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 16),
                ),
              ),
              Container(
                height: 110,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
                  itemCount: _categories.length,
                  itemBuilder: (context, index) =>
                      CategoryCard(category: _categories[index]),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 32),
                ),
              ),
              const SizedBox(height: 24),
              const SectionTitle('Popular Food'),
              GridView.count(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                crossAxisCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                childAspectRatio: (120 / 200),
                scrollDirection: Axis.vertical,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                children: List.generate(_foodList.length,
                    (index) => FoodCard(food: _foodList[index])),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.explore),
            title: const Text('Explore'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            title: const Text('Favorite'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_basket),
            title: const Text('Cart'),
          ),
        ],
      ),
    );
  }
}
