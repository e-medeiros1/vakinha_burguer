import 'package:get/get.dart';
import 'package:vakinha/app/core/services/auth_service.dart';

class SplashController extends GetxController {
  void checkLogged() {
    //Adicionando no get o AuthService e inicializando ele
    Get.putAsync(() => AuthService().init());
  }
//Uma page não pode fazer ações diretamente nela tem que chamar uma
// controller e um controller é alimentada por um binding

}
