import 'package:scalable/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}
