import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CatagoriesScreen extends StatelessWidget {
  const CatagoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final filterdMeals = dummyMeals
        .where((meals) => meals.categories.contains(category.id))
        .toList();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MealsScreen(title: category.title, meals: filterdMeals);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick Your Category"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(18),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectedCategory: () {
                _selectCategory(context, category);
              },
            )
        ],
      ),
    );
  }
}
