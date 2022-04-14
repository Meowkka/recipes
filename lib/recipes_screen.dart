import 'package:flutter/material.dart';
import 'package:recipes/connection.dart';
import 'package:recipes/custom_grid.dart';
import 'package:recipes/recipe_button.dart';
import 'package:recipes/recipe_button_empty.dart';

bool showSpinner = true;
List<Row> rows = [];


class RecipesScreen extends StatefulWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {



  void getRows(){
    int i = 0;
    List<RecipeButton> tmp = [];
    Row myRow = new Row();
    for (var elem in recipes){
      tmp.add(elem);
      i++;
      if(i%2==0){
        myRow = new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: tmp,
        );
        rows.add(myRow);
        tmp=[];
      }
      if(i==recipes.length){
        myRow = new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            tmp[0],
            RecipeButtonEmpty(),
          ],
        );
        rows.add(myRow);
        tmp=[];
      }
    }
  }


  void connectionDone(List<RecipeButton> recipes) async {
    await connectToDatabase(host, database, username, password);
    await fetchToRequest();
    setState(() {
      setRecipes();
      getRows();
      print('done');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    try {
      connectionDone(recipes);
    } catch (e) {
      print(e);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Recipes"),
          ),
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.fastfood),
              ),
              Tab(
                icon: Icon(Icons.favorite),
              ),
              Tab(
                icon: Icon(Icons.person),
              ),
            ],
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
          ),
          body: TabBarView(
            children: [
              CustomGrid(),
              /*GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2
                ),
                children: recipes
                /*[
                  Container(
                    color: Colors.blue,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [

                        Container(
                          child: Image.network("https://picsum.photos/250?image=9"),
                          height: 140,
                        ),
                        Text("Pictire 1"),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.blue,
                    height: 200,
                    margin: EdgeInsets.all(10),
                  ),
                  Container(
                    color: Colors.blue,
                    height: 200,
                    margin: EdgeInsets.all(10),
                  ),
                  Container(
                    color: Colors.blue,
                    height: 200,
                    margin: EdgeInsets.all(10),
                  ),
                  Container(
                    color: Colors.blue,
                    height: 200,
                    margin: EdgeInsets.all(10),
                  ),
                  Container(
                    color: Colors.blue,
                    height: 200,
                    margin: EdgeInsets.all(10),
                  ),
                  Container(
                    color: Colors.blue,
                    height: 200,
                    margin: EdgeInsets.all(10),
                  ),
                  Container(
                    color: Colors.blue,
                    height: 200,
                    margin: EdgeInsets.all(10),
                  ),
                ],*/
              ),*/
              Center(
                child: Text("Favorite Recipes"),
              ),
              Center(
                child: Text("Your profile"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


