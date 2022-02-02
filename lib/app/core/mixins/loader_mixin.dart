
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin LoaderMixin on GetxController {
  void loaderListener(RxBool loading) {
    ever(loading, (_) async {
      if (loading.isTrue) {
        await Get.dialog(
          WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          //Proibe o usuário de remover o CircularProgressIndicator da tela
          barrierDismissible: false,
        );
      } else {
        //A partir da versão 5 do Getx deverá ser utilizado o Get.close();
        Get.back();
      }
    });
  }
}
