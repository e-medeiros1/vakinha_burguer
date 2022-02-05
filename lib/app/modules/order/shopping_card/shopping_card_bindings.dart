import 'package:get/get.dart';
import 'package:vakinha/app/repositories/order/order_repository.dart';
import 'package:vakinha/app/repositories/order/order_repository_Impl.dart';
import './shopping_card_controller.dart';

class ShoppingCardBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderRepository>(
        () => OrderRepositoryImpl(restClient: Get.find()));
    Get.put(ShoppingCardController(
      authService: Get.find(),
      shoppingCardService: Get.find(),
      orderRepository: Get.find(),
    ));
  }
}
