import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scalable/domain/entities/product.dart';
import 'package:scalable/domain/usecases/get_products=use-case.dart';

class HomeControllers extends GetxController {
  final GetProductsUseCase getProductsUseCase;
  HomeControllers(this.getProductsUseCase);
  var isLoading = true.obs;
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  void fetchProduct() async {
    try {
      isLoading(true);
      var result = await getProductsUseCase.call();
      products.assignAll(result);
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
