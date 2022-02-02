import 'package:get/get.dart';
import 'package:vakinha/app/core/rest_client/rest_client.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    //Aqui será colocado tudo o que quero que seja utilizado pela aplicação toda

    Get.lazyPut(
      () => RestClient(),
      fenix: true,
    );
    //Serve pra tudo que quer manter sempre ativo durante a aplicação como um todo
  }
}
