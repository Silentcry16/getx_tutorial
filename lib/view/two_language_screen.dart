import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/utils/translation.dart';

class TwoLangScreen extends StatelessWidget {
  const TwoLangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        title: Text(MyTranslation.appBar.tr),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => SimpleDialog(
                          title: Text(MyTranslation.translationTitle.tr),
                          children: [
                            Column(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Get.updateLocale(const Locale('fa', 'IR'));
                                      Get.back();
                                    },
                                    child: const Text('Farsi')),
                                TextButton(
                                    onPressed: () {
                                      Get.updateLocale(const Locale('en', 'US'));
                                      Get.back();
                                    },
                                    child: const Text('English')),
                              ],
                            )
                          ],
                        ));
              },
              icon: const Icon(Icons.translate))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            MyTranslation.message.tr,
            style: const TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}
