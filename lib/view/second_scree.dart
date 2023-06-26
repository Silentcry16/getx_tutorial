import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/controller/product_controller.dart';
import 'package:getx_tutorial/model/product_model.dart';
import 'package:getx_tutorial/view/getbuild_screen.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX(
              init: ProductController(
                  productModel:
                      ProductModel(name: 'cola', price: '20000', off: '20%')
                          .obs),
              builder: (ProductController productController) {
                return Column(
                  children: [
                    Text(
                      'product name: ${productController.productModel.value.name}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'product price: ${productController.productModel.value.price}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'product off: ${productController.productModel.value.off}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(GetbuildScreen());
                  },
                  child: Text('Next'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.find<ProductController>().productModel.update((val) {
                      val!.name = 'cola';
                      val!.price = '800';
                      val!.off = '25%';
                    });
                  },
                  child: Text('Update'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
