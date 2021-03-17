import 'package:ecommerce/models/movie_provider.dart';
import 'package:ecommerce/screens/Home.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();



  runApp(
    ChangeNotifierProvider<Products>(
      create: (_) => Products(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blue,
          canvasColor: Color.fromRGBO(255, 238, 219, 1)),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
