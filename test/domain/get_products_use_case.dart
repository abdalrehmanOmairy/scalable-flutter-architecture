import 'package:flutter_test/flutter_test.dart';
import 'package:scalable/domain/entities/product.dart';
import 'package:scalable/domain/repository/product_repository.dart';
import 'package:scalable/domain/usecases/get_products=use-case.dart';

class MockProductRepository implements ProductRepository {
  @override
  Future<List<Product>> getProducts() async {
    return [
      Product(
        id: '1',
        name: 'Mock Product 1',
        description: '',
        imageUrl: '',
        price: 10.00,
      ),
      Product(
        id: '2',
        name: 'Mock Product 2',
        description: '',
        imageUrl: '',
        price: 2.00,
      ),
    ];
  }
}

void main() {
  late GetProductsUseCase useCase;
  late MockProductRepository mockRepositroy;

  //Arrange
  setUp(() {
    mockRepositroy = MockProductRepository();
    useCase = GetProductsUseCase(mockRepositroy);
  });
  group('GetProductsUseCase', () {
    test('should get a list of products from the repositroy ', () async {
      //Act
      final result = await useCase.call();

      //Assert
      expect(result.length, 2);
      expect(result.first.id, '1');
      expect(result, isA<List<Product>>());
    });
  });
}
