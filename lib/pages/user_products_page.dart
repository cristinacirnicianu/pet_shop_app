import 'package:flutter/material.dart';
import 'package:petshopapp/providers/products_provider.dart';
import 'package:provider/provider.dart';

class UserProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your products'),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: () {},),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(itemCount: productData.items.length ,
            itemBuilder: (_, index) =>),
      ),
    );
  }
}
