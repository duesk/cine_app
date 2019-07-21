import 'package:flutter/material.dart';
 
import 'package:cine_app/src/pages/homePage.dart';


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "peliculas",
      initialRoute: "/",
      routes: {
        "/" :(BuildContext context) => HomePage(),
      },
    );
  }
} 