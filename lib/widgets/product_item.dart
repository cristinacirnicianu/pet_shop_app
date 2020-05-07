import 'package:flutter/material.dart';
import 'package:petshopapp/providers/cart.dart';
import '../providers/product.dart';
import 'package:provider/provider.dart';
import '../pages/product_detail_page.dart';

class ProductItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen:  false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(ProductDetailPage.routeName, arguments: product.id);
          },
            child: Image.network(product.imageUrl, fit: BoxFit.cover,)),
        footer: GridTileBar(title: Text(product.title, textAlign: TextAlign.center,),
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(icon: Icon( product.isFavorite ? Icons.favorite : Icons.favorite_border), onPressed: (){
              product.toggleFavorite();
            }, color: Theme.of(context).accentColor,),
          ),
          trailing: IconButton(icon: Icon(Icons.shopping_cart), 
            onPressed: (){
            cart.addItem(product.id, product.price, product.title);
          }, color: Theme.of(context).accentColor,),
          backgroundColor: Colors.black87,),
      ),
    );
  }
}
