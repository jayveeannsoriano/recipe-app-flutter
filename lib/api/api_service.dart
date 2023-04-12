import 'package:recipe_app_flutter/api/api_client.dart';
import 'package:recipe_app_flutter/api/handler/recipe_api.dart';

class ApiService {
  static final ApiService _apiService = ApiService._internal();

  factory ApiService() => _apiService;

  ApiService._internal();

  late final ApiClient _apiClient = ApiClient();

  late final Uri _baseUri = Uri.parse(ApiClient.baseUrl);

  RecipeApi? _recipesApi;

  RecipeApi get recipesApi => _recipesApi ??= RecipeApi(apiClient: _apiClient, baseUri: _baseUri);
}
