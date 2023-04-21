import 'package:recipe_app_flutter/features/recipe_overview_page/widgets/recipe_card.dart';
import 'package:recipe_app_flutter/api/model/recipes.dart';
import 'package:recipe_app_flutter/utils/colors.dart';
import 'package:recipe_app_flutter/utils/constants.dart';
import 'package:recipe_app_flutter/widgets/spacings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class RecipeListView extends StatelessWidget {
  const RecipeListView({
    required this.recipeList,
    required this.shouldShowFallback,
    Key? key,
  }) : super(key: key);

  final List<Recipes> recipeList;
  final bool shouldShowFallback;

  @override
  Widget build(BuildContext context) {
    if (recipeList.isEmpty && shouldShowFallback) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(searchFallbackImage),
            const VerticalSpacing(spacing: 10.0),
            const Text(
              'Make it your own way',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const VerticalSpacing(spacing: 10.0),
            const Text(
              'Add a recipe',
              style: TextStyle(fontSize: 16.0),
            ),
            const VerticalSpacing(spacing: 20.0),
            CircleAvatar(
              backgroundColor: primaryColor,
              child: IconButton(
                icon: const Icon(Icons.add),
                //TODO: add new recipe/meal functionality to be implemented
                onPressed: () {},
                color: iconColor,
                iconSize: 20.0,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: recipeList.length,
      itemBuilder: (_, index) {
        final recipe = recipeList[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: RecipeCard(recipe: recipe),
        );
      },
    );
  }
}
