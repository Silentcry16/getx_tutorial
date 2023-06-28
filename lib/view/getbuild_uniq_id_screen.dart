import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/controller/product_getbuilder_uniqe_id_controller%20.dart';
import 'package:getx_tutorial/model/product_model.dart';

class GetbuildUniqeIDScreen extends StatelessWidget {
 const GetbuildUniqeIDScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.find<ProductGetBuilderUniqeIdController>().setValu(index);
            },
            child: Container(
              decoration: BoxDecoration(border: Border.all()),
              margin:const EdgeInsets.all(20),
              child: GetBuilder<ProductGetBuilderUniqeIdController>(
                id: index,
                init: ProductGetBuilderUniqeIdController(
                    productModel:
                        ProductModel(name: 'پفک', price: '1000', off: '50%')),
                builder:
                    (ProductGetBuilderUniqeIdController productController) {
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
            ),
          );
        },
      )),
    );
  }
}
