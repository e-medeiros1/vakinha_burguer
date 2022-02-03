import 'package:get/get.dart';
import 'package:vakinha/app/repositories/auth/auth_repository.dart';
import 'package:vakinha/app/repositories/auth/auth_repository_impl.dart';

import 'package:vakinha/app/modules/auth/login/login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(
        restClient: Get.find(),
      ),
    );

    Get.lazyPut(
      () => LoginController(authRepository: Get.find()),
    );
  }
}
