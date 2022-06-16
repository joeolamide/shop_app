import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Package:shop_app/screens/products_overview_screen.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/provider/products_provider.dart';
import 'package:shop_app/provider/cart.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/provider/orders.dart';

//constant in flutter--> line 6
void main() => runApp(MyApp());
//code below just build the main screen,setting the
//ProductsOverviewScreen as a default screen that gonna pop up.
//A little configuration on the font, style, color etc.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
    providers: [
        ChangeNotifierProvider(
        create: (ctx) => Products(),
        ),


      ChangeNotifierProvider(
        create: (ctx) => Cart(),
      ),

      ChangeNotifierProvider(
        create: (ctx) =>Orders(),
      ),

        ],

      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
      ProductDetailScreen.routeName:(ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
        }
      ),
    );
  }
}

