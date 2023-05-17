import 'package:flutter/material.dart';
import 'pages/detail_page.dart';
import 'package:shoping_cart/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/home': (BuildContext ctx) => HomePage(),
        '/detail': (BuildContext ctx) => DetailPage(),
      },
    );
  }
}
