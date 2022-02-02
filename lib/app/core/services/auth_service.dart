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
      if (value != null) {
        _isLogged == true;
      } else {
        _isLogged == false;
      }

      //Método mais refinado
      //Se value for diferente de null ele é true
      // _isLogged(value != null);
    });
  }

  //Método de logout
  void logout() {
    //Escreve no getStorage que a User_key é nula
    _getStorage.write(Constants.USER_KEY, null);

    int? getUserId() {
      //Lê a minha user_key
      _getStorage.read(Constants.USER_KEY);
    }
  }
}
