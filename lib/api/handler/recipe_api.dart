import 'package:recipe_app_flutter/api/api_client.dart';
import 'package:recipe_app_flutter/api/model/recipe_details.dart';

typedef Json = Map<String, dynamic>;

class RecipeApi {
  RecipeApi({
    required this.apiClient,
    required this.baseUri,
  });

  final ApiClient apiClient;
  final Uri baseUri;

  Future<List<RecipeDetails>> getRecipeDetails({required List<String> recipes}) async {
    final List<RecipeDetails> recipeDetailsList = [];

    for (String recipe in recipes) {
      final queryParameters = <String, dynamic>{};
      queryParameters['s'] = recipe;

      final uri = baseUri.replace(path: '${baseUri.path}/search.php', queryParameters: queryParameters);
      final List<dynamic> recipeList = (await apiClient.dio.getUri(uri)).data['meals'];

      recipeDetailsList
          .addAll(recipeList.map<RecipeDetails>((dynamic data) => RecipeDetails.fromJson(data as Json)).toList());
    }
    return recipeDetailsList;
  }
}
