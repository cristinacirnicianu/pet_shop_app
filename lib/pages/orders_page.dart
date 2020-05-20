import 'package:flutter/material.dart';
import '../providers/orders.dart' show Orders;
import '../widgets/app_drawer.dart';
import '../widgets/order_item.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Your orders'),
      ),
      drawer: AppDrawer(),
      body:FutureBuilder(future: Provider.of<Orders>(context, listen: false).fetchAndSetOrders(), builder: (ctx, dataProvider) {
        if(dataProvider.connectionState ==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        } else {
          if(dataProvider.error != null){
            //do error code
            return Center(child: Text('An error ocurred'),);
          } else {
            return Consumer<Orders>(builder: (ctx, ordersData, child) => ListView.builder(
                itemCount: ordersData.orders.length,
                itemBuilder: (ctx, index) => OrderItem(ordersData.orders[index])),);
          }
        }
      },),
    );
  }
}
