import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scalable/presentation/card/controllers/cart_controller.dart';
import 'package:scalable/presentation/home/binding/home_binding.dart';
import 'package:scalable/presentation/home/home_page.dart';
import 'package:scalable/presentation/home/product_detail/product_detail_page.dart';

void main() {
  // Register CartController as a Singleton before the app runs
  Get.put(CardController());
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'G-Store',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/home',
      getPages: [
        GetPage(
          name: '/home',
          page: () => const HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(name: '/product-detail', page: () => ProductDetailPage()),
      ],
    );
  }
}
