import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  const LargeButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 60.0),
        textStyle: Theme.of(context).textTheme.headline6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: () => onPressed,
      child: Text(label),
    );
  }
}
