import 'package:scalable/data/adapters/product_api_adapter.dart';
import 'package:scalable/domain/entities/product.dart';
import 'package:scalable/domain/repository/product_repository.dart';

class ProductRepositoryIpml implements ProductRepository {
  final ProductApiAdapter _apiAdapter;

  ProductRepositoryIpml(this._apiAdapter);

  @override
  Future<List<Product>> getProducts() async {
    try {
      final List<Map<String, dynamic>> jsonList = await _apiAdapter
          .fetchProducts();
      final products = jsonList
          .map((jsonMap) => Product.fromJson(jsonMap))
          .toList();
      return products;
    } catch (e) {
      throw Exception('Failed to get product : $e');
    }
  }
}
