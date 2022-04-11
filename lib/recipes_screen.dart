import 'package:flutter/material.dart';
import 'package:recipes/connection.dart';
import 'package:recipes/recipe_button.dart';

bool showSpinner = true;


class RecipesScreen extends StatefulWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {

  void connectionDone(List<RecipeButton> recipes) async{
    await connectToDatabase(host,database,username,password);
    await fetchToRequest();
    setState(() {
      setRecipes();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    try {
      connectionDone(recipes);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
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
                Center(
                  child: Column(
                    children: [
                      Row(
                        children: recipes,
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ],
                  ),
                ),
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
