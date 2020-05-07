import 'package:flutter/material.dart';
import 'package:petshopapp/widgets/products_grid.dart';

class ProductsOverviewPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PetShop'),
      ),
      body: ProductsGrid()
    );
  }
}
