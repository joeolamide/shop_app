import 'package:flutter/material.dart';
import 'package:shop_app/provider/cart.dart';
import 'package:provider/provider.dart';


class CartItem extends StatelessWidget {
  final String? id;
  final double? productId;
  final double? price;
  final int? quantity;
  final String? title;

  CartItem(this.id, this.price, this.quantity, this.title, this.productId);


  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin:EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId) ;
      } ,
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(child: Text('\$$price'),),
            title: Padding(
              padding: EdgeInsets.all(5),
              child: FittedBox(
                  child: Text(title!),
              ),
            ),
            subtitle: Text('Total: \$${(price! * quantity!)}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
