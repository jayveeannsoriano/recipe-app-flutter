import 'package:recipe_app_flutter/features/onboarding_page/onboarding_page.dart';
import 'package:recipe_app_flutter/utils/app_theme.dart';
import 'package:recipe_app_flutter/state/app_state.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  final store = Store<AppState>(
    initialState: AppState(),
    actionObservers: kReleaseMode ? null : [ConsoleActionObserver<AppState>()],
  );

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
