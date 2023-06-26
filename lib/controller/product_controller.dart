import 'package:get/get.dart';
import 'package:getx_tutorial/model/product_model.dart';

class ProductController extends GetxController {
  // The "obs" variable, is a reactive variable which listens to the value changes
  Rx<ProductModel> productModel;
  ProductController({required this.productModel});
}
