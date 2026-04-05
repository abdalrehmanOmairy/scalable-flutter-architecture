import 'package:flutter_test/flutter_test.dart';
import 'package:scalable/data/adapters/product_api_adapter.dart';
import 'package:scalable/data/repositories/repository.dart';
import 'package:scalable/domain/entities/product.dart';
import 'package:scalable/domain/repository/product_repository.dart';

class MockProductApiAdapter implements ProductApiAdapter {
  @override
  Future<List<Map<String, dynamic>>> fetchProducts() async {
    return [
      {
        'id': '1',
        'name': 'Test Product 1',
        'price': '10.00',
        'description': '',
        'imageUrl': '',
      },
      {
        'id': '2',
        'name': 'Test Product 2',
        'price': '9.00',
        'description': '',
        'imageUrl': '',
      },
    ];
  }
}

void main() {
  group('ProductRepositoryImpl', () {
    test(
      'should return a list of products when the call is sccessful',
      () async {
        //Arrange
        final mockApiAdapter = MockProductApiAdapter();
        final repository = ProductRepositoryIpml(mockApiAdapter);

        //Act
        final products = await repository.getProducts();

        //Assert
        expect(products, isA<List<Product>>());
        expect(products.length, 2);
        expect(products.first.name, 'Test Product 1');
      },
    );
  });
}
