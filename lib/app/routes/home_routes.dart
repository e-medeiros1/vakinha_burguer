import 'package:get/get.dart';
import 'package:vakinha/app/modules/home/home_bindings.dart';
import 'package:vakinha/app/modules/home/home_page.dart';

class HomeRoutes {
  HomeRoutes._();

  static final routers = <GetPage>[
    GetPage(
      name: '/home',
      binding: HomeBindings(),
      page: () => const HomePage(),
    ),
  ];
}
