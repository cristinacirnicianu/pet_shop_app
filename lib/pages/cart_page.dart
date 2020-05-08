import 'package:flutter/material.dart';
import 'package:petshopapp/widgets/cart_item.dart';
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
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount}',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    child: Text('ORDER NOW'),
                    onPressed: () {},
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) => CartItem(
                     id: cart.getItems.values.toList()[index].id,
                     productId: cart.getItems.keys.toList()[index],
                      title: cart.getItems.values.toList()[index].title,
                     price: cart.getItems.values.toList()[index].price,
                     quantity: cart.getItems.values.toList()[index].quantity,
                    ),
                itemCount: cart.getItems.length),
          ),
        ],
      ),
    );
  }
}
