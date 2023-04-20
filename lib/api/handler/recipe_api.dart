import 'package:recipe_app_flutter/api/api_client.dart';
import 'package:recipe_app_flutter/api/model/recipe_details.dart';
import 'package:recipe_app_flutter/api/model/recipes.dart';

typedef Json = Map<String, dynamic>;

class RecipeApi {
  RecipeApi({
    required this.apiClient,
    required this.baseUri,
  });

  final ApiClient apiClient;
  final Uri baseUri;

  Future<List<Recipes>> getRecipeList({required List<String> recipes}) async {
    final List<Recipes> listedRecipes = [];

    for (String recipe in recipes) {
      final queryParameters = <String, dynamic>{};
      queryParameters['s'] = recipe;

      final uri = baseUri.replace(path: '${baseUri.path}/search.php', queryParameters: queryParameters);
      final List<dynamic> recipeList = (await apiClient.dio.getUri(uri)).data['meals'];

      listedRecipes.addAll(recipeList.map<Recipes>((dynamic data) => Recipes.fromJson(data as Json)).toList());
    }
    return listedRecipes;
  }

  Future<RecipeDetails> getRecipeDetails({required String name}) async {
    final uri = baseUri.replace(path: '${baseUri.path}/search.php/$name');
    return await apiClient.dio.getUri(uri).then((response) => RecipeDetails.fromJson(response.data));
  }
}
