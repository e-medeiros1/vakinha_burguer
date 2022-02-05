import 'package:get/get.dart';
import 'package:vakinha/app/modules/order/finished/fishined_page.dart';
import 'package:vakinha/app/modules/order/pix/pix_page.dart';

class OrdersRoutes {
  OrdersRoutes._();
  static final routers = <GetPage>[
    GetPage(
      name: '/orders/finished',
      page: () => FishinedPage(),
    ),
    GetPage(
      name: '/orders/pix',
      page: () =>  PixPage(),
    ),
  ];
}
