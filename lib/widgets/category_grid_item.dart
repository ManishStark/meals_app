import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {required this.category, required this.onSelectedCategory, super.key});

  final Category category;
  final void Function() onSelectedCategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectedCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.55),
            category.color.withOpacity(0.9)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Text(
          category.title,
          style: const TextStyle(fontSize: 20, color: Colors.white),
          // style: Theme.of(context).textTheme.titleLarge!.copyWith(
          //     color: Theme.of(context).colorScheme.onBackground, fontSize: 35),
        ),
      ),
    );
  }
}
