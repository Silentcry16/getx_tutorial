import 'package:get/get.dart';
import 'package:getx_tutorial/model/product_model.dart';

class ProductController extends GetxController {
  // The "obs" variable, is a reactive variable which listens to the value changes
  // Rx<ProductModel> productModel;
  // ProductController({required this.productModel})

  final List<ProductModel> _productList = [];

  List<ProductModel> get productList => _productList;

  List<ProductModel> readAllProducts() {
    return _productList;
  }

  void addProducts(
      {required String name, required String price, required String off}) {
    var product = ProductModel(name: name, price: price, off: off);
    _productList.add(product);
    print(_productList[0].name);
    update();
  }

  void removeProduct(String productId) {
    _productList.removeWhere((element) => element.id == productId);
    update();
  }

  void updateProducts(
      {required String productId,
      required String name,
      required String price,
      required String off}) {
    var index = productList.indexWhere((element) => element.id == productId);
    if (index != -1) {
      productList[index].name = name;
      productList[index].price = price;
      productList[index].off = off;
    }
    update();
  }
}
