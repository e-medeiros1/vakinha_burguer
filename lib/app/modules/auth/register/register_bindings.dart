import 'package:get/get.dart';
import 'package:vakinha/app/modules/auth/register/register_controller.dart';
import 'package:vakinha/app/repositories/auth/auth_repository.dart';
import 'package:vakinha/app/repositories/auth/auth_repository_impl.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
        () => AuthRepositoryImpl(restClient: Get.find()));

    Get.lazyPut(() => RegisterController(authRepository: Get.find()));
  }
}

    //A dependencie é o repository - Ao apertar o botão de cadastrar, ele vai
    //chamar o repository e o repository vai chamar o backend

    //Como estamos trabalhando com interface, precisamos chamar o lazyPut com a
    //nossa interface AuthRepository

    //O auth necessita do RestClient

    //Será criado fora do binding, pois tudo que é utilizado por toda a aplicação
    //não pode ficar dentro do próprio binding

    //Get.find para recuperar o restClient
