import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/models/product.dart';

class ShoppingController extends GetxController{
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  void fetchProduct() async{
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(
          id: 1,
          price: 30,
          productDesc: 'some description about product',
          productImage: 'abd',
          productName: 'FirstProd'),
      Product(
          id: 2,
          price: 40,
          productDesc: 'some description about product',
          productImage: 'abd',
          productName: 'SecProd'),
      Product(
          id: 3,
          price: 49.5,
          productDesc: 'some description about product',
          productImage: 'abd',
          productName: 'ThirdProd'),
      

    ];
    products.value = productResult;
  }
}

