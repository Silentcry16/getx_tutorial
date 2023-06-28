class ProductModel {
  String id = DateTime.now().toString();
  String name;
  String price;
  String off;

  ProductModel({required this.name, required this.price, required this.off});
}
