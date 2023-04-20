import 'package:recipe_app_flutter/api/api_service.dart';
import 'package:recipe_app_flutter/state/action/actions.dart';
import 'package:recipe_app_flutter/state/app_state.dart';
import 'package:recipe_app_flutter/utils/constants.dart';
import 'package:async_redux/async_redux.dart';

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

/// Performs search functionality in Recipe Overview Page
class SearchRecipesAction extends ReduxAction<AppState> {
  SearchRecipesAction({required this.searchQuery});

  final String searchQuery;

  @override
  AppState reduce() {
    final searchRecipes =
        state.recipes.where((recipe) => recipe.name.toLowerCase().contains(searchQuery.toLowerCase())).toList();

    return state.copyWith(searchRecipes: searchRecipes);
  }
}

///Clears the state of the searchbar
class ClearSearchedRecipesAction extends ReduxAction<AppState> {
  @override
  AppState reduce() => state.copyWith(searchRecipes: List.empty());
}
