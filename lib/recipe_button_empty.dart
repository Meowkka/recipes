import 'package:flutter/material.dart';

class RecipeButtonEmpty extends StatefulWidget {
  RecipeButtonEmpty();

  @override
  State<RecipeButtonEmpty> createState() => _RecipeButtonState();
}

class _RecipeButtonState extends State<RecipeButtonEmpty> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 140,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
