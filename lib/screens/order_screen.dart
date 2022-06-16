import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/orders.dart';

class OrderScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders '),
      ),
      body: ListView.builder(itemCount: orderData.orders.length, itemBuilder: (ctx, i) => ,)
    );
  }
}
