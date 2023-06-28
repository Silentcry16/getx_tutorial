import 'package:get/get.dart';
import 'package:getx_tutorial/controller/product_controller.dart';

class initDep implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController());
  }
}
