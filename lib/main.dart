import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Package:shop_app/screens/products_overview_screen.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/provider/products_provider.dart';
import 'package:shop_app/provider/cart.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/provider/orders.dart';
import 'package:shop_app/screens/orders_screen.dart';
import 'package:shop_app/screens/user_product_screen.dart';
import 'package:shop_app/screens/edit_product_screen.dart';
import 'package:shop_app/screens/auth_screen.dart';
import 'package:shop_app/provider/auth.dart';

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
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          create:(ctx) => Products('', []),
          update: (ctx, auth, previousProducts) => Products(auth.token,
              previousProducts == null ? [] : previousProducts.items),


        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
      ],
      child: Consumer <Auth>(builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: auth.isAuth ? ProductsOverviewScreen() : AuthScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
          }),)
    );
  }
}
