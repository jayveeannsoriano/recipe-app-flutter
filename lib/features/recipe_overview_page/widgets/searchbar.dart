import 'package:recipe_app_flutter/utils/colors.dart';
import 'package:flutter/material.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({
    required this.controller,
    required this.onClear,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final VoidCallback onClear;

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  bool _showSuffixIcon = false;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    widget.controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: searchbarColor,
      ),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: Visibility(
            visible: _showSuffixIcon,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 35.0,
                  child: CircleAvatar(
                    backgroundColor: iconBgColor,
                    child: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: widget.onClear,
                      color: iconColor,
                      iconSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          hintText: "Search here...",
          hintStyle: TextStyle(color: searchbarHintTextColor),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  void _onTextChanged() {
    setState(() => _showSuffixIcon = widget.controller.text.isNotEmpty);
  }
}
