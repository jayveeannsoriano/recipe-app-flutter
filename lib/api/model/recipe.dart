import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  //TODO: model to be modified
  factory Recipe({
    @JsonKey(name: 'idMeal') required String id,
    @JsonKey(name: 'strMeal') required String name,
    @JsonKey(name: 'strCategory') required String category,
    @JsonKey(name: 'strMealThumb') required String imageUrl,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
