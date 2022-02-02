// import 'package:vakinha/app/models/user_model.dart';

// abstract class AuthRepository {
//   //Criando o método de login, para após o cadastro ele se logar automaticamente
//   Future<UserModel> login(String email, String password);
//   //Implementação do cadastro de cliente
//   Future<UserModel> register(String name, String email, String password);
// }

import 'package:vakinha/app/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> register(String name, String email, String password);

  Future<UserModel> login(String email, String password);
}
