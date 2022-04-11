import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'package:recipes/recipe_button.dart';

String host = '';
String database = '';
String username = '';
String password = '';
bool isConnected = false;
List<List<dynamic>> results=[];
var connection;
List<RecipeButton> recipes = [];


Future<void> connectToDatabase (String host,String database,String usName,String pass) async {
  connection = PostgreSQLConnection(host, 5432, database, username: usName, password: pass, useSSL: true);
  try{
    await connection.open();
    print('connected');
    isConnected = true;
  } catch(e) {
    print('error');
    print(e.toString());
  }
}

Future<void> fetchToRequest () async{
 results = await connection.query("select * from recipes order by created_on desc");
 print('Executed');
}




void setRecipes(){
  for (final row in results) {
    print('${row[0]} ${row[5]}');
    recipes.add(RecipeButton(Key(row[0].toString()),row[5],row[4],Icon(Icons.star_border)));
  }
}

