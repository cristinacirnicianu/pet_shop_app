import 'package:flutter/material.dart';
import 'package:petshopapp/pages/edit_product_page.dart';
import 'package:petshopapp/providers/products_provider.dart';
import 'package:petshopapp/widgets/app_drawer.dart';
import 'package:petshopapp/widgets/user_product_item.dart';
import 'package:provider/provider.dart';

class UserProductsPage extends StatelessWidget {
  static const routeName = '/user-products';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductPage.routeName);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: productData.items.length,
            itemBuilder: (_, index) => Column(
                  children: [
                    UserProductItem(
                        productData.items[index].id,
                        productData.items[index].title,
                        productData.items[index].imageUrl),
                    Divider(),
                  ],
                )),
      ),
    );
  }
}
