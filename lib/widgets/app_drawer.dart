import 'package:flutter/material.dart';
import 'package:petshopapp/helpers/custom_route.dart';
import 'package:petshopapp/pages/user_products_page.dart';
import 'package:petshopapp/providers/auth.dart';
import 'package:provider/provider.dart';
import '../pages/orders_page.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text('Hellow user!'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.shop, semanticLabel: 'Shop',),
           title: Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrdersPage.routeName);
           //   Navigator.of(context).pushReplacement(CustomRoute(builder: (ctx) => OrdersPage(),),);
              //cannot use this future until solve CustomRoute issue
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage products'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(UserProductsPage.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');

            Provider.of<Auth>(context).logout();
            },
          ),
        ],
      ),
    );
  }
}
