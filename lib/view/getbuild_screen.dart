import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/controller/product_getbuilder_controller.dart';
import 'package:getx_tutorial/model/product_model.dart';
import 'package:getx_tutorial/view/getbuild_uniq_id_screen.dart';

class GetbuildScreen extends StatelessWidget {
  const GetbuildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<ProductGetBuilderController>(
              init: ProductGetBuilderController(
                  productModel:
                      ProductModel(name: 'پفک', price: '1000', off: '50%')),
              builder: (ProductGetBuilderController productController) {
                return Column(
                  children: [
                    Text(
                      'product name: ${productController.productModel.name}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      'product price: ${productController.productModel.price}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      'product off: ${productController.productModel.off}',
                      style: const TextStyle(fontSize: 20),
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
                    Get.to(const GetbuildUniqeIDScreen());
                  },
                  child: const Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.find<ProductGetBuilderController>().setValu();
                  },
                  child: const Text('Update'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
