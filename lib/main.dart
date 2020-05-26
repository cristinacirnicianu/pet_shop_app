import 'package:flutter/material.dart';
import 'package:petshopapp/helpers/custom_route.dart';
import 'package:petshopapp/pages/auth_page.dart';
import 'package:petshopapp/pages/edit_product_page.dart';
import 'package:petshopapp/pages/spash_page.dart';
import 'package:petshopapp/pages/user_products_page.dart';
import 'package:petshopapp/providers/auth.dart';
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
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          update: (_, auth, previousProducts) => Products(
              auth.token,
              auth.userId,
              previousProducts == null ? [] : previousProducts.items),
//          builder: (ctx, auth, previousProducts) => Products(
//              auth.token, previousProducts ==null ? [] : previousProducts.items),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          update: (_, auth, previousOrders) => Orders(auth.token, auth.userId,
              previousOrders == null ? [] : previousOrders.orders),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'PetShop',
          theme: ThemeData(
              textTheme: TextTheme(
                title: TextStyle(color: Colors.black),
              ),
              primarySwatch: Colors.orange,
              fontFamily: 'Lato',
//              pageTransitionsTheme: PageTransitionsTheme(builders:
////              {
////                TargetPlatform.android: CustomPageTransitionBuilder(),
////                TargetPlatform.iOS: CustomPageTransitionBuilder(),
////              }),  use it after fix CustomRoute issue
              accentColor: Colors.deepOrange),
          home: auth.isAuth
              ? ProductsOverviewPage()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashPage()
                          : AuthPage()),
          routes: {
            ProductDetailPage.routeName: (ctx) => ProductDetailPage(),
            CartPage.routeName: (ctx) => CartPage(),
            OrdersPage.routeName: (ctx) => OrdersPage(),
            UserProductsPage.routeName: (ctx) => UserProductsPage(),
            EditProductPage.routeName: (ctx) => EditProductPage(),
          },
        ),
      ),
    );
  }
}
