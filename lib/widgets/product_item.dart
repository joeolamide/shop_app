import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/product.dart';
import 'package:shop_app/provider/cart.dart';
// how to get the product.
class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.imageUrl, this.title);

  @override
  Widget build(BuildContext context) {
    //final productId = ModalRoute.of(context)!.settings.arguments;
    final product = Provider.of<Product>(context, listen:false);
    final cart = Provider.of<Cart>(context, listen:false);
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,
                arguments: product.id,
              );
            },
            child: Image.network(
              product.imageUrl!,
              fit: BoxFit.cover,
            ),
          ),
          footer:GridTileBar(
            backgroundColor: Colors.black87,
            leading: Consumer<Product>(
              builder: (ctx,product, _) =>IconButton(
                icon: Icon(
                  product.isFavorite! ? Icons.favorite : Icons.favorite_border,
                ),
                color: Theme.of(context).accentColor,
                onPressed: (){
                  product.toggleFavoriteStatus();
                },
            ),
            ),
            title: Text(
              product.title!,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: (){
                cart.addItem(product.id!, product.price!, product.title!);
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                  content: Text('Added item to cart!',),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(label: 'UNDO',
                    onPressed: (){
                    cart.removeSingleItem(product.id!);
                  },)
                  ),
                );
              },
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      );
  }
}
