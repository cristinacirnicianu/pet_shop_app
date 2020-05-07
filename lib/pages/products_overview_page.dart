import 'package:flutter/material.dart';
import 'package:petshopapp/providers/cart.dart';
import 'package:petshopapp/widgets/badge.dart';
import 'package:petshopapp/widgets/products_grid.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewPage extends StatefulWidget {
  @override
  _ProductsOverviewPageState createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PetShop'),
          actions: [
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
              },
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text('Only favorites'),
                  value: FilterOptions.Favorites,
                ),
                PopupMenuItem(
                  child: Text('Show all'),
                  value: FilterOptions.All,
                ),
              ],
            ),
            Consumer<Cart>(
              builder: (_, cartData, ch) =>
                  Badge(child: ch, value: cartData.itemCount.toString()),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart),
              ),
            )
          ],
        ),
        body: ProductsGrid(_showOnlyFavorites));
  }
}
