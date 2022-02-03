import 'package:get/get.dart';
import 'package:vakinha/app/core/rest_client/rest_client.dart';
import 'package:vakinha/app/core/services/shopping_card_service.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RestClient(),
      fenix: true,
    );
    Get.lazyPut<dynamic>(() => ShoppingCardService());
  }
}
