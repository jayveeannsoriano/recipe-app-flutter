import 'package:flutter/material.dart';

class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing({
    required this.spacing,
    Key? key,
  }) : super(key: key);

  final double spacing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: spacing,
    );
  }
}

class HorizontalSpacing extends StatelessWidget {
  const HorizontalSpacing({
    Key? key,
    required this.spacing,
  }) : super(key: key);
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: spacing,
    );
  }
}
