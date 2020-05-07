import 'package:flutter/material.dart';
import 'package:petshopapp/widgets/products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PetShop'),
        actions: [
          PopupMenuButton(icon: Icon(Icons.more_vert),
          onSelected: (FilterOptions selectedValue ) {
            print(selectedValue);
          },
          itemBuilder: (_)=>[
            PopupMenuItem(child: Text('Only favorites'), value: FilterOptions.Favorites,),
            PopupMenuItem(child: Text('Show all'), value: FilterOptions.All,),
          ],)
        ],
      ),
      body: ProductsGrid()
    );
  }
}
