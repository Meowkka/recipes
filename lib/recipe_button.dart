import 'package:flutter/material.dart';

class RecipeButton extends StatefulWidget {
  final Key key;
  final String url;
  final String title;
  Icon icon;

  RecipeButton(@required this.key,@required this.url, @required this.title, this.icon);

  @override
  State<RecipeButton> createState() => _RecipeButtonState();
}

class _RecipeButtonState extends State<RecipeButton> {



  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.url,
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                margin: EdgeInsets.all(10),
                height: 140,
                //child: Image.network()
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: widget.icon,
                  color: Colors.yellow,
                  onPressed: (){
                    setState(() {
                      if (widget.icon.icon.toString() ==
                          Icons.star_border.toString()) {
                        widget.icon = Icon(Icons.star);
                      } else {
                        widget.icon = Icon(Icons.star_border);
                      }
                    });
                  },
                ),
              ),
            ],
          ),
          Text(widget.title),
        ],
      ),
    );
  }
}
