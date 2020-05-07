import 'package:flutter/material.dart';
import 'package:petshopapp/providers/products_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/product_item.dart';


class ProductsGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   final productsData = Provider.of<Products>(context);
   final products = productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (context, index) => ProductItem(products[index].id,
          products[index].title, products[index].imageUrl),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
