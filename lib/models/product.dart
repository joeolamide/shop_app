import 'package:flutter/material.dart';

class Product{
  final String? id;
  final String? title;
  final double? price;
  final String? description;
  final String? imageUrl;
  final bool? isFavorite;

  //create a constructor.
Product({
  @required this.id,
  @required this.title,
  @required this.price,
  @required this.description,
  @required this.imageUrl,
  this.isFavorite = false,

});



}
