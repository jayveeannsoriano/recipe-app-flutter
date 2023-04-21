import 'dart:async';

import 'package:recipe_app_flutter/api/model/recipes.dart';
import 'package:recipe_app_flutter/features/recipe_overview_page/widgets/recipe_list_view.dart';
import 'package:recipe_app_flutter/features/recipe_overview_page/widgets/searchbar.dart';
import 'package:recipe_app_flutter/utils/async.dart';
import 'package:recipe_app_flutter/utils/colors.dart';
import 'package:recipe_app_flutter/utils/constants.dart';
import 'package:recipe_app_flutter/widgets/spacings.dart';
import 'package:flutter/material.dart';

class RecipeOverviewPage extends StatefulWidget {
  const RecipeOverviewPage({
    required this.recipes,
    required this.searchRecipes,
    required this.onSearchRecipes,
    required this.onClearSearchedRecipes,
    super.key,
  });

  final Async<List<Recipes>> recipes;
  final List<Recipes> searchRecipes;
  final ValueChanged<String> onSearchRecipes;
  final VoidCallback onClearSearchedRecipes;

  @override
  State<RecipeOverviewPage> createState() => _RecipeOverviewPageState();
}

class _RecipeOverviewPageState extends State<RecipeOverviewPage> {
  late TextEditingController _searchbarController;
  late bool isSearching;
  late String title;
  Timer? _debounceTimer;
  bool _showFloatingActionButton = false;

  @override
  void initState() {
    super.initState();

    _searchbarController = TextEditingController()
      ..addListener(() {
        _onSearchRecipes();
        _onTextChanged();
      });

    isSearching = false;
    title = 'Your Recipes';
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _searchbarController.dispose();
    widget.onClearSearchedRecipes();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Hungry? \nGet inspired...',
                          style: Theme.of(context).textTheme.headline5?.copyWith(
                                color: primaryColor,
                                fontWeight: FontWeight.w900,
                              ),
                        ),
                      ],
                    ),
                    Column(
                      children: const [
                        CircleAvatar(
                          backgroundImage: AssetImage(avatarImage),
                          maxRadius: 30.0,
                        )
                      ],
                    ),
                  ],
                ),
                const VerticalSpacing(spacing: 40.0),
                Searchbar(
                  controller: _searchbarController,
                  onClear: _clearSearchbarField,
                ),
                const VerticalSpacing(spacing: 30.0),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            title,
                            style: Theme.of(context).textTheme.headline6?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: isSearching
                      ? RecipeListView(
                          recipeList: widget.searchRecipes,
                          shouldShowFallback: true,
                        )
                      : widget.recipes.when(
                          (data) => RecipeListView(
                            recipeList: data,
                            shouldShowFallback: false,
                          ),
                          loading: () => const Center(child: CircularProgressIndicator()),
                          error: (errorMessage) => Center(
                            child: Text(errorMessage!),
                          ),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: _showFloatingActionButton,
        child: FloatingActionButton(
          //TODO: add new recipe/meal functionality to be implemented
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _clearSearchbarField() {
    _searchbarController.clear();
    widget.onClearSearchedRecipes();
    setState(() {
      isSearching = false;
      title = 'Your Recipes';
    });
  }

  void _onSearchRecipes() {
    if (_debounceTimer?.isActive ?? false) _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(seconds: 1), _searchRecipes);
  }

  void _searchRecipes() {
    if (_searchbarController.text.isNotEmpty) {
      widget.onSearchRecipes(_searchbarController.text);
      setState(() {
        isSearching = true;
        title = 'Your Results';
      });
    }
  }

  void _onTextChanged() {
    setState(() => _showFloatingActionButton = _searchbarController.text.isEmpty);
  }
}
