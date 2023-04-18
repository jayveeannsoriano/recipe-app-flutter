import 'package:recipe_app_flutter/api/api_service.dart';
import 'package:recipe_app_flutter/state/action/actions.dart';
import 'package:recipe_app_flutter/state/app_state.dart';
import 'package:recipe_app_flutter/utils/constants.dart';

/// Get the list of recipes from recipe API
class GetRecipesAction extends LoadingAction {
  static const key = 'get-recipes-action';

  GetRecipesAction() : super(actionKey: key);

  @override
  Future<AppState> reduce() async {
    final recipes = await ApiService().recipesApi.getRecipeList(recipes: listedRecipes);

    return state.copyWith(recipes: recipes);
  }
}

/// Get recipe details based on recipe name from recipe API
class GetRecipeDetailsAction extends LoadingAction {
  static const key = 'get-recipe-details-action';

  GetRecipeDetailsAction({required this.recipeName}) : super(actionKey: key);

  final String recipeName;

  @override
  Future<AppState> reduce() async {
    final recipeDetails = await ApiService().recipesApi.getRecipeDetails(name: recipeName);

    return state.copyWith(recipeDetails: recipeDetails);
  }
}
