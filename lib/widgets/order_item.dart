import 'package:flutter/material.dart';
import 'package:shop_app/provider/orders.dart' as ord;



class OrderItem extends StatelessWidget {
  final ord.OrderItem order;
  OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(children: <widget>[
        ListTile(tile: Text('\$${order.amount}'),),
      ],)
    );
  }
}
