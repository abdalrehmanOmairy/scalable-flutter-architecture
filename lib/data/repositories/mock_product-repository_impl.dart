import 'package:scalable/domain/entities/product.dart';
import 'package:scalable/domain/repository/product_repository.dart';

class MockProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<Product>> getProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Product(
        id: 'mock1',
        name: 'mock product 1',
        description: '',
        imageUrl: '',
        price: 1.0,
      ),
      Product(
        id: 'mock2',
        name: 'mock product 2',
        description: '',
        imageUrl: '',
        price: 2.0,
      ),
    ];
  }
}
