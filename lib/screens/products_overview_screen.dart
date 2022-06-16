import 'package:flutter/material.dart';
import 'package:shop_app/widgets/products_grid.dart';
import 'package:shop_app/widgets/badge.dart';
import 'package:shop_app/provider/cart.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/cart_screen.dart';

//a list of products seen in the overview page.

enum FilterOptions {
  Favorites,
  All,
}
class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    //this will appear as a screen for the app.
    return Scaffold(
      appBar: AppBar(
        title: Text('Afrique-Store'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedvalue){
              setState(() {
                if (selectedvalue == FilterOptions.Favorites){
                  _showOnlyFavorites = true;
                }else {
                  _showOnlyFavorites = false;
                }
              });
              if (selectedvalue == FilterOptions.Favorites){
                  _showOnlyFavorites = true;
              }else {
                _showOnlyFavorites = false;
              }
            },
            icon: Icon(
              Icons.more_vert,
      ), itemBuilder: (_) => [
        PopupMenuItem(child: Text('Only Favorites'),
            value: FilterOptions.Favorites,
        ),
        PopupMenuItem(child: Text('Show All'),
            value: FilterOptions.All,
            ),
          ],
          ),
          Consumer<Cart>(builder: (_, cart, ch ) =>  Badge(
            child: ch!,
            value: cart.itemCount.toString(),
                ),
             child: IconButton(
              icon: Icon(
            Icons.shopping_cart,
          ),
                onPressed: (){
                Navigator.of(context).pushNamed(CartScreen.routeName);
                },
          ),

          ),

        ],
    ),

      body:  ProductsGrid(_showOnlyFavorites),
    );
  }
}

