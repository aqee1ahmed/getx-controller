import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/controller/shopping_controller.dart';
import 'package:getx_flutter/models/product.dart';

import '../controller/cart_controller.dart';

class ShoppingPage extends StatelessWidget {
  final ShoppingControllers = Get.put(ShoppingController());
  final cartControllers = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.red,
            ],
          )),
          child: Column(
            children: [
              Expanded(
                child: GetX<ShoppingController>(builder: (controller) {
                  return ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white70,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          margin: const EdgeInsets.all(12),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${controller.products[index].productName}',
                                          style: TextStyle(fontSize: 24),
                                        ),
                                        Text(
                                            '${controller.products[index].productDesc}'),
                                      ],
                                    ),
                                    Text(
                                        '\$${controller.products[index].price}',
                                        style: TextStyle(fontSize: 24)),
                                  ],
                                ),
                                RaisedButton(
                                  onPressed: () {
                                    cartControllers
                                        .addToCart(controller.products[index]);
                                  },
                                  color: Colors.blue,
                                  textColor: Colors.white,
                                  child: Text('Add to Cart'),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }),
              ),
              GetX<CartController>(builder: (controller) {
                return Text(
                  'Total Amount: \$ ${controller.totalPrice}',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                );
              }),
              SizedBox(height: 100)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(
          Icons.add_shopping_cart_rounded,
          color: Colors.white,
        ),
        label: GetX<CartController>(builder: (controller) {
          return Text(
            controller.count.toString(),
            style: TextStyle(fontSize: 24),
          );
        }),
      ),
    );
  }
}
