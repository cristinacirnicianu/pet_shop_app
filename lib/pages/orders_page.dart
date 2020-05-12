import 'package:flutter/material.dart';
import 'package:petshopapp/providers/orders.dart' show Orders;
import 'package:petshopapp/widgets/order_item.dart';
import 'package:provider/provider.dart';
class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Your orders'),),
      body: ListView.builder(itemCount: ordersData.orders.length,
          itemBuilder: (ctx, index)=>OrderItem(ordersData.orders[index])),
    );
  }
}
