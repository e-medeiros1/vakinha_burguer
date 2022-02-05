import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha/app/core/services/auth_service.dart';
import 'package:vakinha/app/core/services/shopping_card_service.dart';
import 'package:vakinha/app/modules/menu/menu_bindings.dart';
import 'package:vakinha/app/modules/menu/menu_page.dart';
import 'package:vakinha/app/modules/order/shopping_card/shopping_card_bindings.dart';
import 'package:vakinha/app/modules/order/shopping_card/shopping_card_page.dart';

class HomeController extends GetxController {
  // ignore: constant_identifier_names
  static const NAVIGATOR_KEY = 1;
  final ShoppingCardService _shoppingCardService;

  final _tabIndex = 0.obs;
  final _tabs = ['/menu', '/order/shopping_card', '/exit'];

  HomeController({required ShoppingCardService shoppingCardService})
      : _shoppingCardService = shoppingCardService;

  int get tabIndex => _tabIndex.value;
  int get totalProductsInShoppingCard => _shoppingCardService.totalProducts;

  set tabIndex(int index) {
    _tabIndex(index);
    if (_tabs[index] == '/exit') {
      Get.find<AuthService>().logout();
    } else {
      Get.toNamed(_tabs[index], id: NAVIGATOR_KEY);
    }
  }

  Route? onGeneratedRouter(RouteSettings settings) {
    if (settings.name == '/menu') {
      return GetPageRoute(
          settings: settings,
          page: () => const MenuPage(),
          binding: MenuBindings(),
          transition: Transition.fadeIn);
    }
    if (settings.name == '/order/shopping_card') {
      return GetPageRoute(
          settings: settings,
          page: () =>  ShoppingCardPage(),
          binding: ShoppingCardBindings(),
          transition: Transition.fadeIn);
    }
  }
}
