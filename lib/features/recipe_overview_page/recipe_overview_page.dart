import 'package:recipe_app_flutter/state/action/recipe_actions.dart';
import 'package:recipe_app_flutter/state/app_state.dart';
import 'package:recipe_app_flutter/utils/constants.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

class RecipeOverviewPage extends StatelessWidget {
  const RecipeOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: This is are alternative approaches for connector. This will be replaced later
    StoreProvider.dispatch<AppState>(context, GetRecipeDetailsAction(recipes: recipes));

    return const Placeholder();
  }
}
