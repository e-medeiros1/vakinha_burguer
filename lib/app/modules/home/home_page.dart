import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:vakinha/app/core/ui/widgets/icon_badge.dart';
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
          selectedIconTheme: const IconThemeData(
            size: 30,
          ),
          enableFeedback: true,
          showUnselectedLabels: false,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.list_rounded), label: 'Produtos'),
            BottomNavigationBarItem(
              icon: IconBadge(
                icon: Icons.shopping_cart_outlined,
                number: controller.totalProductsInShoppingCard,
              ),
              label: 'Carrinho',
            ),
            const BottomNavigationBarItem(
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
