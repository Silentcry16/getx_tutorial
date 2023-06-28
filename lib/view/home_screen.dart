import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/controller/product_controller.dart';
import 'package:getx_tutorial/model/product_model.dart';
import 'package:getx_tutorial/view/second_scree.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // var counter = 0.obs;
  // var bool = true.obs;
  ProductController productController = Get.put(ProductController(
      productModel:
          ProductModel(name: 'burger', price: '5000', off: '50%').obs));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Column(
                children: [
                  Text(
                    'product name: ${productController.productModel.value.name}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    'product price: ${productController.productModel.value.price}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    'product off: ${productController.productModel.value.off}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    productController.productModel.update((val) {
                      val!.name = 'spageti';
                      val.price = '65800';
                      val.off = '20%';
                    });
                  },
                  child: const Text('update'),
                ),
                ElevatedButton(
                  onPressed: () => Get.to(const SecondScreen()),
                  child: const Text('scond screen'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
