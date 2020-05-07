import 'package:flutter/material.dart';
import '../providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
final productId = ModalRoute.of(context).settings.arguments as String;
final loadedProducts = Provider.of<Products>(context).items.firstWhere((prod) => prod.id == productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProducts.title),
      ),
    );
  }
}

