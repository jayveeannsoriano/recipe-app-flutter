import 'package:recipe_app_flutter/api/model/recipes.dart';
import 'package:recipe_app_flutter/utils/colors.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    required this.recipe,
    Key? key,
  }) : super(key: key);

  final Recipes recipe;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
              recipe.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 160.0,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(1),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ListTile(
              title: Text(
                recipe.category,
                style: const TextStyle(color: foregroundColor),
              ),
              subtitle: Text(
                recipe.name,
                style: const TextStyle(color: foregroundColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
