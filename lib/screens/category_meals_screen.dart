import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    //any .of(context) doesn't work so add didChangeDependencies
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    _loadedInitData = true;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, id) {
          return MealItem(
            id: displayedMeals[id].id,
            title: displayedMeals[id].title,
            imageUrl: displayedMeals[id].imageUrl,
            duration: displayedMeals[id].duration,
            complexity: displayedMeals[id].complexity,
            affordability: displayedMeals[id].affordability,

          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
