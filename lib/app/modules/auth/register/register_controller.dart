import 'dart:developer';

import 'package:get/get.dart';
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
    super.onInit();
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _loading.toggle();
      // final userModel =
      await _authRepository.register(name, email, password);
      _loading.toggle();
      Get.back();
      _message(MessageModel(
        title: "Sucesso!",
        message: "Cadastro realizado com sucesso",
        type: MessageType.info,
      ));
    } on RestClientException catch (e, s) {
      _loading.toggle();

      log('Erro ao registrar usuário', error: e, stackTrace: s);
      _message(MessageModel(
        title: "Erro!",
        message: e.message,
        type: MessageType.error,
      ));
    } catch (e, s) {
      _loading.toggle();

      log('Erro ao registrar usuário', error: e, stackTrace: s);
      _message(MessageModel(
        title: "Error",
        message: 'Erro ao registrar usuário',
        type: MessageType.error,
      ));
    }
  }
}
