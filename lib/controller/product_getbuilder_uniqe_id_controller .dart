import 'package:get/get.dart';

import 'package:getx_tutorial/model/product_model.dart';

class ProductGetBuilderUniqeIdController extends GetxController {
  ProductModel productModel;
  ProductGetBuilderUniqeIdController({required this.productModel});

  setValu(int id) {
    productModel = ProductModel(name: 'محصول جدید', price: '250', off: '50%');
    update([id]);
  }
}
