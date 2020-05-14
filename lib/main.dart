import 'package:flutter/material.dart';
import 'package:petshopapp/pages/edit_product_page.dart';
import 'package:petshopapp/pages/user_products_page.dart';
import './pages/cart_page.dart';
import './pages/orders_page.dart';
import './providers/cart.dart';
import './providers/orders.dart';
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
        ChangeNotifierProvider.value(value: Cart(),),
        ChangeNotifierProvider.value(value: Orders()),
      ],
      child: MaterialApp(
        title: 'PetShop',
        theme: ThemeData(
          textTheme: TextTheme(
            title:TextStyle(color: Colors.black),
          ),
            primarySwatch: Colors.orange,
            fontFamily: 'Lato',
            accentColor: Colors.deepOrange),
        home: ProductsOverviewPage(),
        routes: {
          ProductDetailPage.routeName: (ctx) => ProductDetailPage(),
          CartPage.routeName: (ctx) => CartPage(),
          OrdersPage.routeName: (ctx) => OrdersPage(),
          UserProductsPage.routeName: (ctx)=>UserProductsPage(),
          EditProductPage.routeName: (ctx)=>EditProductPage(),
        },
      ),
    );
  }
}
