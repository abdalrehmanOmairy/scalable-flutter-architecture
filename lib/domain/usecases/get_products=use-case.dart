import 'package:scalable/domain/entities/product.dart';
import 'package:scalable/domain/repository/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository repository;
  GetProductsUseCase(this.repository);
  Future<List<Product>> call() async {
    return await repository.getProducts();
  }
}
