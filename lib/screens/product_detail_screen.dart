import 'package:flutter/material.dart';
import 'package:shop_app/provider/products_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;
  //
  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-detail';


  @override
  Widget build(BuildContext context) {
  final productId = ModalRoute.of(context)!.settings.arguments as String;

  final loadedProduct = Provider.of<Products>(
    context,
    listen: false,
    ).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title!),
      ),
    );
  }
}
