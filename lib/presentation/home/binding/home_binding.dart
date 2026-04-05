import 'package:get/get.dart';
import 'package:scalable/core/repository_factory.dart';
import 'package:scalable/data/adapters/product_api_adapter.dart';
import 'package:scalable/data/repositories/repository.dart';
import 'package:scalable/domain/usecases/get_products=use-case.dart';
import 'package:scalable/presentation/home/controllers/home_controllers.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    //Data Layer
    Get.lazyPut(() => ProductApiAdapter());
    Get.lazyPut(
      <ProductRepository>() => RepositoryFactory.createProductRepository(),
    );

    //Domain Layer
    Get.lazyPut(() => GetProductsUseCase(Get.find()));

    //Presentation Layer
    Get.lazyPut(() => HomeControllers(Get.find()));
  }
}
