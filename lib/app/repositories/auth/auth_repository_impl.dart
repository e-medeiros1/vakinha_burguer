import 'package:vakinha/app/core/exceptions/user_notfound_exception.dart';
import 'package:vakinha/app/core/rest_client/rest_client.dart';
import 'package:vakinha/app/models/user_model.dart';

import './auth_repository.dart';

import 'dart:developer';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient _restClient;

  AuthRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<UserModel> register(String name, String email, String password) async {
    var message;
    final result = await _restClient.post('/auth/register', {
      "name": name,
      "email": email,
      "password": password,
    });

    if (result.hasError) {
      message = 'Erro ao registrar usuário';
      if (result.statusCode == 400) {
        message = result.body['error'];
      }

      log(
        message,
        error: result.statusText,
        stackTrace: StackTrace.current,
      );

      throw RestClientException(message);
    }

    return login(email, password);
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final result = await _restClient.post(
      '/auth/',
      {
        'email': email,
        'password': password,
      },
    );
    //Se tiver algum erro, verifica de qual tipo ele é
    if (result.hasError) {
      if (result.statusCode == 403) {
        //Se tiver inválido, o user não foi encontrado
        log('Usuário ou senha inválidos',
            error: result.statusText, stackTrace: StackTrace.current);
        //Criando exceção específica, ao invés de retornar um user nulo
        //a exceção será tratada
        throw UserNotFoundException();
      }
      log('Erro ao autenticar o usuário ${result.statusCode}',
          error: result.statusText, stackTrace: StackTrace.current);
      throw RestClientException('Erro ao autenticar usuário');
    }
    return UserModel.fromMap(result.body);
  }
}
