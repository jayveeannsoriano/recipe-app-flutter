import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipes.freezed.dart';

part 'recipes.g.dart';

@freezed
class Recipes with _$Recipes {
  factory Recipes({
    @JsonKey(name: 'strMeal') required String name,
    @JsonKey(name: 'strCategory') required String category,
    @JsonKey(name: 'strMealThumb') required String imageUrl,
  }) = _Recipes;

  factory Recipes.fromJson(Map<String, dynamic> json) => _$RecipesFromJson(json);
}
