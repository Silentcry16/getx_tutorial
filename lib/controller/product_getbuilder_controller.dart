import 'package:get/get.dart';
import 'package:getx_tutorial/model/product_model.dart';

class ProductGetBuilderController extends GetxController {
  ProductModel productModel;
  ProductGetBuilderController({required this.productModel});

  setValu() {
    productModel = ProductModel(name: 'نوشمک', price: '250', off: '50%');
    update();
  }
}
