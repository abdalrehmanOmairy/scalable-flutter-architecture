import 'package:scalable/data/adapters/product_api_adapter.dart';
import 'package:scalable/data/repositories/mock_product-repository_impl.dart';
import 'package:scalable/data/repositories/repository.dart';
import 'package:scalable/domain/repository/product_repository.dart';

class RepositoryFactory {
  static const bool useMock = false;
  static ProductRepository createProductRepository() {
    if (useMock) {
      return MockProductRepositoryImpl();
    } else {
      return ProductRepositoryIpml(ProductApiAdapter());
    }
  }
}
