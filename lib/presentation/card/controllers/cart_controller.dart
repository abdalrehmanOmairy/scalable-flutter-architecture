import 'package:get/get.dart';
import 'package:scalable/domain/entities/product.dart';

class CardController extends GetxController {
  var cartItem = <Product>[].obs;

  void addToCart(Product product) {
    cartItem.add(product);
  }
}
