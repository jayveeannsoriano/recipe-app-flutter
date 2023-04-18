import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/utils/colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: searchbarColor,
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search here...",
          hintStyle: TextStyle(color: searchbarHintTextColor),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
