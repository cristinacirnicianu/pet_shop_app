import 'package:flutter/material.dart';
import './pages/products_overview_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetShop',
      theme: ThemeData(
          primarySwatch: Colors.orange,
      fontFamily: 'Lato',
      accentColor: Colors.deepOrange),
      home: ProductsOverviewPage(),
    );
  }
}
