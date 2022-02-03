import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha/app/core/constants/constants.dart';
import 'package:vakinha/app/core/mixins/loader_mixin.dart';
import 'package:vakinha/app/core/mixins/messages_mixin.dart';
import 'package:vakinha/app/core/rest_client/rest_client.dart';
import 'package:vakinha/app/repositories/auth/auth_repository.dart';

class RegisterController extends GetxController
    with LoaderMixin, MessagesMixin {
  final AuthRepository _authRepository;
  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  RegisterController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit;
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _loading.toggle();

      final userLogged = await _authRepository.register(name, email, password);

      _loading.toggle();

      GetStorage().write(Constants.USER_KEY, userLogged.id);

      /*_message(
        MessageModel(
          title: 'Informação',
          message: 'Registro realizado com sucesso',
          type: MessageType.info,
        ),
      );*/

    } on RestClientException catch (e, s) {
      _loading.toggle();
      log('Erro ao registrar o usuário', error: e, stackTrace: s);
      _message(
        MessageModel(
          title: 'Erro',
          message: e.message.toString(),
          type: MessageType.error,
        ),
      );
    } catch (e, s) {
      log('Erro ao registrar o usuário', error: e, stackTrace: s);
      _message(
        MessageModel(
          title: 'Erro',
          message: 'Erro ao registrar o usuário',
          type: MessageType.error,
        ),
      );
    }
  }
}
