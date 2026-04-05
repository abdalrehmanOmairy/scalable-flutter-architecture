import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:scalable/domain/entities/product.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:scalable/presentation/home/home_page.dart';
import 'package:scalable/presentation/home/controllers/home_controllers.dart';
import 'home_page_widget_test_mocks.dart';

@GenerateMocks([HomeControllers])
void main() {
  late MockHomeController mockHomeController;
  setUp(() {
    Get.reset();
    mockHomeController = MockHomeController;
    Get.put<HomeControllers>(mockHomeController);
  });
  final tProductList = [
    Product(
      id: '1',
      name: 'Product A',
      description: 'des B',
      imageUrl: 'url A',
      price: 10.00,
    ),
    Product(
      id: '2',
      name: 'Product B',
      description: 'des B',
      imageUrl: 'url B',
      price: 10.00,
    ),
  ];

  Widget createTestableWidget(Widget child) {
    return GetMaterialApp(home: child);
  }

  group('HomePage', () {
    testWidgets('should display a loading indicator while loading', (
      WidgetTester tester,
    ) async {
      //Arrange
      when(mockHomeController.isLoading).thenReturn(true.obs);
      when(mockHomeController.product).thenReturn(<Product>[].obs);

      //Act
      await tester.pumpWidget(createTestableWidget(const HomePage()));

      //Assert

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(GridView), findsNothing);
    });

    testWidgets('should display a grid of products when loading', (
      WidgetTester tester,
    ) async {
      //Arrange
      when(mockHomeController.isLoading).thenReturn(false.obs);
      when(mockHomeController.product).thenReturn(tProductList.obs);

      //Act
      await tester.pumpWidget(createTestableWidget(const HomePage()));

      //Assert

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(GridView), findsOneWidget);
      expect(find.text('Product A'), findsOneWidget);
    });
  });
}
