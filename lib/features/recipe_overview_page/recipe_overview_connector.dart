import 'package:recipe_app_flutter/features/recipe_overview_page/recipe_overview_page.dart';
import 'package:recipe_app_flutter/features/recipe_overview_page/recipe_overview_vm.dart';
import 'package:recipe_app_flutter/state/action/recipe_actions.dart';
import 'package:recipe_app_flutter/state/app_state.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

class RecipeOverviewConnector extends StatelessWidget {
  const RecipeOverviewConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, RecipeOverviewVm>(
      vm: () => RecipeOverviewVmFactory(),
      onInit: (store) => store.dispatchAsync(GetRecipesAction()),
      builder: (context, vm) => RecipeOverviewPage(recipes: vm.recipes),
    );
  }
}
