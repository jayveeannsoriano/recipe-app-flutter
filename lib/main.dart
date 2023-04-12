import 'package:recipe_app_flutter/api/api_service.dart';
import 'package:recipe_app_flutter/utils/app_theme.dart';
import 'package:recipe_app_flutter/features/onboarding_page/onboarding_page.dart';
import 'package:recipe_app_flutter/state/app_state.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//TODO: Future added for debugging. This will be removed
Future<void> main() async {
  final store = Store<AppState>(
    initialState: AppState(),
    actionObservers: kReleaseMode ? null : [ConsoleActionObserver<AppState>()],
  );

  //TODO: Added for debugging. This will be removed
  final recipe = await ApiService().recipesApi.getRecipe(name: 'Sushi');
  recipe;

  runApp(
    StoreProvider(
      store: store,
      child: MaterialApp(
        home: const OnboardingPage(),
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
