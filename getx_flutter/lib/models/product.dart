import 'package:flutter/cupertino.dart';

class Product {
  final int id;
  final String productName;
  final String productImage;
  final String productDesc;
  final double price;

  Product({required this.id,required this.productName, required this.productImage, required this.productDesc, required this.price});
}
