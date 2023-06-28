import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/helper/init_dependency.dart';
import 'package:getx_tutorial/utils/translation.dart';
import 'package:getx_tutorial/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: initDep(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
