import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha/app/core/constants/constants.dart';

//Item de serviço que nunca morre
class AuthService extends GetxService {
  //Variável boolean do tipo observável
  final _isLogged = RxnBool();
  final _getStorage = GetStorage();

  Future<AuthService> init() async {
    //Criando listener que fica escutando a UserKey
    _getStorage.listenKey(Constants.USER_KEY, (value) {
      // if (value != null) {
      //   _isLogged == true;
      // } else {
      //   _isLogged == false;
      // }

      //Método mais refinado
      //Se value for diferente de null ele é true
      _isLogged(value != null);
    });

    //Adicionando workers
    ever<bool?>(_isLogged, (isLogged) {
      //Se não estiver logado, volta para tela de login
      if (isLogged == null || !isLogged) {
        Get.offAllNamed('/auth/login');
      } else {
        //Caso esteja logado, vai pra página home
        //Método semelhante ao Navigator.of(context).popAndRemoveUntil();
        //Remove toda a árvore de telas e devolve só a '/home'
        Get.offAllNamed('/home');
      }
    });
    //Código didático
    // final isLoggedData = getUserId() != null;
    // _isLogged(isLoggedData);

    //Código refinado
    _isLogged(getUserId() != null);
    return this;
  }

  //Método de logout
  void logout() {
    //Escreve no getStorage que a User_key é nula
    _getStorage.write(Constants.USER_KEY, null);
  }

//Lê a minha user_key
  int? getUserId() => _getStorage.read(Constants.USER_KEY);
}
