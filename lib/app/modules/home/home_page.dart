import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha/app/core/services/auth_service.dart';
import 'package:vakinha/app/core/ui/widgets/vakinha_appbar.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppBar(),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.list_rounded), label: 'Produtos'),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Carrinho',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app),
              label: 'Sair',
            ),
          ],
          currentIndex: controller.tabIndex,
          onTap: (value) => controller.tabIndex = value,
        );
      }),
      body: Navigator(
        initialRoute: '/menu',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: controller.onGeneratedRouter,
      ),
    );
  }
}
