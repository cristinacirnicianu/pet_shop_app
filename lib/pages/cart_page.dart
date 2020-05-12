import 'package:flutter/material.dart';
import '../providers/cart.dart' show Cart;
import 'package:provider/provider.dart';
import '../widgets/cart_item.dart';

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: TextStyle(fontSize: 20),),
                  SizedBox(width: 10,),
                  Spacer(),
                  Chip(
                    label: Text('\$${cart.totalAmount}', style: TextStyle(color: Colors.white),),
                  backgroundColor: Theme.of(context).primaryColor,),
                  FlatButton(child: Text('ORDER NOW',),textColor: Theme.of(context).primaryColor, onPressed: () {},),
                ],
              ),
            ),
          ),
          SizedBox(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) =>CartItem(
                  cart.items.values.toList()[index].id,
                cart.items.keys.toList()[index],
                cart.items.values.toList()[index].price,
                cart.items.values.toList()[index].quantity,
                cart.items.values.toList()[index].title
              ) ,
            itemCount: cart.items.length,),
          )
        ],
      ) ,
    );
  }
}
