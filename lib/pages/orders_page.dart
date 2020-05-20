import 'package:flutter/material.dart';
import '../providers/orders.dart' show Orders;
import '../widgets/app_drawer.dart';
import '../widgets/order_item.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatefulWidget {
  static const routeName = '/orders';

  @override
  _OrdersPageState createState()=>_OrdersPageState();

}

class _OrdersPageState extends State<OrdersPage> {
  var _isLoading = false;
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      setState(() {
        _isLoading = true;
      });
     await Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Your orders'),),
      drawer: AppDrawer(),
      body:_isLoading ?Center(child: CircularProgressIndicator()) : ListView.builder(itemCount: ordersData.orders.length,
          itemBuilder: (ctx, index)=>OrderItem(ordersData.orders[index])),
    );
  }


}
