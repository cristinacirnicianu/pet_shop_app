import 'package:flutter/material.dart';
import '../providers/cart.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: TextStyle( fontSize: 20,),),
                  Spacer(),
                  Chip(label: Text('\$${cart.totalAmount}',
                    style: TextStyle(
                        color: Colors.white),),
                    backgroundColor: Theme.of(context).primaryColor,),
                  FlatButton(child: Text('ORDER NOW'), onPressed: () {}, textColor: Theme.of(context).primaryColor,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
