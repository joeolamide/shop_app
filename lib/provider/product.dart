import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Product with ChangeNotifier{
  final String? id;
  final String? title;
  final double? price;
  final String? description;
  final String? imageUrl;
  bool? isFavorite;

  //create a constructor.
Product({
  @required this.id,
  @required this.title,
  @required this.price,
  @required this.description,
  @required this.imageUrl,
  this.isFavorite = false,

});

    void _setFavValue(bool newValue){
      isFavorite =  newValue;
      notifyListeners();
    }


  Future <void> toggleFavoriteStatus() async {
    final oldStatus = isFavorite;
    isFavorite =!isFavorite!;
    notifyListeners();
    final url = Uri.parse(
        'https://afrique-store-default-rtdb.firebaseio.com/products/$id.json');
    try {
      final response = await http.patch(
        url,
      body:json.encode({
        isFavorite = !isFavorite!,
      }),
      );
          if (response.statusCode >= 400){
          _setFavValue(oldStatus!);
          notifyListeners();
          }

    } catch (error)
      {
        _setFavValue(oldStatus!);
      }
    }
}




