import 'package:async_redux/async_redux.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app_flutter/api/model/recipe_details.dart';
import 'package:recipe_app_flutter/api/model/recipes.dart';

part 'app_state.freezed.dart';

part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    @Default(<Recipes>[]) List<Recipes> recipes,
    @Default(<Recipes>[]) List<Recipes> searchRecipes,
    @Default(null) RecipeDetails? recipeDetails,

    //ignored by state
    @Default(Wait.empty) @JsonKey(ignore: true) Wait wait,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
}
