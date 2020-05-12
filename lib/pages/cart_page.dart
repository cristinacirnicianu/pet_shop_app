import 'package:flutter/material.dart';
import 'package:petshopapp/providers/cart.dart';
import 'package:provider/provider.dart';
class CartPage extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Your chart'),),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Total', style: TextStyle(fontSize: 20),),
                  SizedBox(width: 10,),
                  Chip(label: Text('\$${cart.totalAmount}'),
                  backgroundColor: Theme.of(context).primaryColor,)
                ],
              ),
            ),
          )
        ],
      ) ,
    );
  }
}
