import 'package:recipe_app_flutter/utils/colors.dart';
import 'package:recipe_app_flutter/utils/constants.dart';
import 'package:recipe_app_flutter/widgets/buttons.dart';
import 'package:recipe_app_flutter/widgets/spacings.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(onboardingImageBg),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(1),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const VerticalSpacing(spacing: 80.0),
                  Text(
                    'Welcome to the \nRecipe App',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: foregroundColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const VerticalSpacing(spacing: 280.0),
                  const SizedBox(
                    width: 350.0,
                    child: Text(
                      'Did you know that Italian food is the most popular around the world?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const VerticalSpacing(spacing: 30.0),
                  const SizedBox(
                    width: 315.0,
                    child: Text(
                      'Italian pizza in particular is very popular and long ago crossed '
                      'the borders of Italy. It is now consumed all over the world',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  const VerticalSpacing(spacing: 20.0),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: LargeButton(
                      onPressed: () {},
                      label: 'Get Started',
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
