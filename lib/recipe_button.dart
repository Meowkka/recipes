import 'package:flutter/material.dart';

class RecipeButton extends StatelessWidget {

  final String url;
  final String title;

  RecipeButton(@required this.url,@required this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                url,
              ),
              fit: BoxFit.fitHeight,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          height: 160,
          width: 160,
          margin: EdgeInsets.all(10),
          //child: Image.network()
        ),
        Text(title),
      ],
    );
  }
}
