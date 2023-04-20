import 'package:recipe_app_flutter/api/model/recipes.dart';
import 'package:recipe_app_flutter/features/recipe_overview_page/widgets/recipe_card.dart';
import 'package:recipe_app_flutter/features/recipe_overview_page/widgets/searchbar.dart';
import 'package:recipe_app_flutter/utils/async.dart';
import 'package:recipe_app_flutter/utils/colors.dart';
import 'package:recipe_app_flutter/utils/constants.dart';
import 'package:recipe_app_flutter/widgets/spacings.dart';
import 'package:flutter/material.dart';

class RecipeOverviewPage extends StatelessWidget {
  const RecipeOverviewPage({
    required this.recipes,
    super.key,
  });

  final Async<List<Recipes>> recipes;

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
                //TODO: searchbar functionality to be implemented
                const SearchBar(),
                const VerticalSpacing(spacing: 30.0),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            'Your Recipes',
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
                  child: recipes.when(
                    (data) => ListView.builder(
                      itemCount: data.length,
                      itemBuilder: ((_, index) {
                        final recipe = data[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: RecipeCard(recipe: recipe),
                        );
                      }),
                    ),
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: ((errorMessage) => Center(
                          child: Text(errorMessage!),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
