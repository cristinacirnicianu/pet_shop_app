import 'package:flutter/material.dart';
import './providers/cart.dart';
import './providers/products_provider.dart';
import './pages/product_detail_page.dart';
import './pages/products_overview_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products(),
        ),
        ChangeNotifierProvider.value(value: Cart()),
      ],
      child: MaterialApp(
        title: 'PetShop',
        theme: ThemeData(
            primarySwatch: Colors.orange,
            fontFamily: 'Lato',
            accentColor: Colors.deepOrange),
        home: ProductsOverviewPage(),
        routes: {
          ProductDetailPage.routeName: (ctx) => ProductDetailPage(),
        },
      ),
    );
  }
}
