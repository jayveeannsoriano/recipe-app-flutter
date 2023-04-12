import 'package:recipe_app_flutter/api/api_client.dart';
import 'package:recipe_app_flutter/api/model/recipe.dart';

typedef Json = Map<String, dynamic>;

class RecipeApi {
  RecipeApi({
    required this.apiClient,
    required this.baseUri,
  });

  final ApiClient apiClient;
  final Uri baseUri;

  Future<List<Recipe>> getRecipe({required String name}) async {
    final queryParameters = <String, dynamic>{};
    queryParameters['s'] = name;

    final uri = baseUri.replace(path: '${baseUri.path}/search.php', queryParameters: queryParameters);
    return await apiClient.dio.getUri(uri).then((response) {
      return response.data['meals'].map<Recipe>((dynamic data) => Recipe.fromJson(data as Json)).toList();
    });
  }
}
