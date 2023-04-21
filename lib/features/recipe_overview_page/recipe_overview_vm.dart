import 'package:recipe_app_flutter/api/model/recipes.dart';
import 'package:recipe_app_flutter/features/recipe_overview_page/recipe_overview_connector.dart';
import 'package:recipe_app_flutter/state/action/recipe_actions.dart';
import 'package:recipe_app_flutter/state/app_state.dart';
import 'package:recipe_app_flutter/utils/async.dart';
import 'package:recipe_app_flutter/utils/constants.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

class RecipeOverviewVmFactory extends VmFactory<AppState, RecipeOverviewConnector> {
  @override
  Vm fromStore() => RecipeOverviewVm(
        recipes: _recipes(),
        searchRecipes: _searchRecipes,
        onSearchRecipes: _onSearchRecipes,
        onClearSearchedRecipes: _onClearSearchedRecipes,
      );

  Async<List<Recipes>> _recipes() {
    if (state.wait.isWaitingFor(GetRecipesAction.key)) return const Async.loading();

    if (state.recipes.isEmpty) return const Async.error(errorMessage);

    return Async(state.recipes);
  }

  List<Recipes> get _searchRecipes => state.searchRecipes;

  void _onSearchRecipes(searchQuery) => dispatchSync(SearchRecipesAction(searchQuery: searchQuery));

  void _onClearSearchedRecipes() => dispatchSync(ClearSearchedRecipesAction());
}

class RecipeOverviewVm extends Vm {
  RecipeOverviewVm({
    required this.recipes,
    required this.searchRecipes,
    required this.onSearchRecipes,
    required this.onClearSearchedRecipes,
  }) : super(equals: [
          recipes,
          searchRecipes,
        ]);

  final Async<List<Recipes>> recipes;
  final List<Recipes> searchRecipes;
  final ValueChanged<String> onSearchRecipes;
  final VoidCallback onClearSearchedRecipes;
}
