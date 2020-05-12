import 'package:flutter/material.dart';
import '../providers/orders.dart' show Orders;
import '../widgets/app_drawer.dart';
import '../widgets/order_item.dart';
import 'package:provider/provider.dart';
class OrdersPage extends StatelessWidget {
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Your orders'),),
      drawer: AppDrawer(),
      body: ListView.builder(itemCount: ordersData.orders.length,
          itemBuilder: (ctx, index)=>OrderItem(ordersData.orders[index])),
    );
  }
}
