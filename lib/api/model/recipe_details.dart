import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_details.freezed.dart';

part 'recipe_details.g.dart';

@freezed
class RecipeDetails with _$RecipeDetails {
  //TODO: model to be modified
  factory RecipeDetails({
    @JsonKey(name: 'idMeal') required String id,
    @JsonKey(name: 'strMeal') required String name,
    @JsonKey(name: 'strCategory') required String category,
    @JsonKey(name: 'strMealThumb') required String imageUrl,
  }) = _RecipeDetails;

  factory RecipeDetails.fromJson(Map<String, dynamic> json) => _$RecipeDetailsFromJson(json);
}
