import 'package:recipe_app_flutter/api/api_service.dart';
import 'package:recipe_app_flutter/state/app_state.dart';
import 'package:async_redux/async_redux.dart';

/// Get recipe details based on defined list of recipes from API
class GetRecipeDetailsAction extends ReduxAction<AppState> {
  GetRecipeDetailsAction({required this.recipes});

  final List<String> recipes;

  @override
  Future<AppState> reduce() async {
    final recipeDetails = await ApiService().recipesApi.getRecipeDetails(recipes: recipes);

    return state.copyWith(recipeDetails: recipeDetails);
  }
}
