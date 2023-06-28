import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/controller/product_controller.dart';
import 'package:getx_tutorial/model/product_model.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _offController = TextEditingController();

  void _addTask(BuildContext context) {
    ProductModel product;
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                margin: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const Text(
                      'Add New Product',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                        autofocus: true,
                        controller: _nameController,
                        decoration: const InputDecoration(labelText: 'Name')),
                    TextField(
                        keyboardType: TextInputType.number,
                        controller: _priceController,
                        decoration: const InputDecoration(labelText: 'Price')),
                    TextField(
                        keyboardType: TextInputType.number,
                        controller: _offController,
                        decoration: const InputDecoration(labelText: 'Off')),
                    ElevatedButton.icon(
                        onPressed: () {
                          Get.find<ProductController>().addProducts(
                              name: _nameController.text,
                              price: _priceController.text,
                              off: _offController.text);
                          _nameController.text = '';
                          _priceController.text = '';
                          _offController.text = '';
                          Get.back();
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Add Product'))
                  ],
                ),
              )),
        );
      },
    );
  }

  void _editProduct(BuildContext context, int index, String id) {
    ProductModel product;
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        _nameController.text =
            Get.find<ProductController>().productList[index].name;
        _priceController.text =
            Get.find<ProductController>().productList[index].price;
        _offController.text =
            Get.find<ProductController>().productList[index].off;
        return SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                margin: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const Text(
                      'Add New Product',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                        autofocus: true,
                        controller: _nameController,
                        decoration: const InputDecoration(labelText: 'Name')),
                    TextField(
                        keyboardType: TextInputType.number,
                        controller: _priceController,
                        decoration: const InputDecoration(labelText: 'Price')),
                    TextField(
                        keyboardType: TextInputType.number,
                        controller: _offController,
                        decoration: const InputDecoration(labelText: 'Off')),
                    ElevatedButton.icon(
                        onPressed: () {
                          Get.find<ProductController>().updateProducts(
                              productId: id,
                              name: _nameController.text,
                              price: _priceController.text,
                              off: _offController.text);
                          _nameController.text = '';
                          _priceController.text = '';
                          _offController.text = '';
                          Get.back();
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Add Product'))
                  ],
                ),
              )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var _height = Get.height;
    var _width = Get.width;
    var productList = Get.find<ProductController>().productList;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GetX state management',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            color: Colors.white,
          )
        ],
      ),
      body: GetBuilder<ProductController>(
        builder: (controller) => SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(bottom: 10),
            // color: Colors.amber,
            height: _height,
            width: _width,
            child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, i) => Card(
                child: ListTile(
                    title: Text(productList[i].name ?? 'No name'),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(productList[i].off),
                        Text(productList[i].price),
                      ],
                    ),
                    trailing: Container(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.find<ProductController>()
                                    .removeProduct(productList[i].id);
                              },
                              icon: Icon(Icons.delete)),
                          IconButton(
                              onPressed: () {
                                _editProduct(context, i, productList[i].id);
                              },
                              icon: Icon(Icons.edit)),
                        ],
                      ),
                    )),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(context),
        backgroundColor: Colors.purple,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
