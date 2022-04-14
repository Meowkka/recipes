import 'package:flutter/material.dart';

import 'package:recipes/recipes_screen.dart';

class CustomGrid extends StatefulWidget {
  const CustomGrid({Key? key}) : super(key: key);

  @override
  State<CustomGrid> createState() => _CustomGridState();

}

class _CustomGridState extends State<CustomGrid> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: rows,
        ),
      ]
    );
  }
}
