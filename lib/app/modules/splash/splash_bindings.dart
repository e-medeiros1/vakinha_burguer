import 'package:get/get.dart';
import 'package:vakinha/app/modules/splash/splash_controller.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}

//Uma page não pode fazer ações diretamente nela tem que chamar uma
// controller e um controller é alimentada por um binding