import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, id) {
          return MealItem(
            id: categoryMeals[id].id,
            title: categoryMeals[id].title,
            imageUrl: categoryMeals[id].imageUrl,
            duration: categoryMeals[id].duration,
            complexity: categoryMeals[id].complexity,
            affordability: categoryMeals[id].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
