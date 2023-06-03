import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

import '../models/meal.dart';

class CatagoriesScreen extends StatelessWidget {
  const CatagoriesScreen({required this.onToggleFavorites,super.key});
    final void Function(Meal meal) onToggleFavorites;

  void _selectCategory(BuildContext context, Category category) {
    final filterdMeals = dummyMeals
        .where((meals) => meals.categories.contains(category.id))
        .toList();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MealsScreen(title: category.title, meals: filterdMeals, onToggleFavorites:onToggleFavorites ,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return  GridView(
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
    );
  }
}
