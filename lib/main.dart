import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha/app/core/bindings/application_binding.dart';
import 'package:vakinha/app/core/ui/vakinha_ui.dart';
import 'package:vakinha/app/routes/auth_routes.dart';
import 'package:vakinha/app/routes/splash_routes.dart';

Future<void> main(List<String> args) async {
  await GetStorage.init();
  runApp(const VakinhaBurguerMainApp());
}

class VakinhaBurguerMainApp extends StatelessWidget {
  const VakinhaBurguerMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //Para tirar o banner de debug
      debugShowCheckedModeBanner: false,
      title: 'Vakinha Burger',
      //Adicionando o tema
      theme: VakinhaUI.theme,
      //Inicia o binding na hora que inicia a aplicação
      initialBinding: ApplicationBinding(),
      //Trabalhando com rotas no Getx
      getPages: [
        ...SplashRoutes.routers,
        ...AuthRoutes.routers,
      ],
    );
  }
}
