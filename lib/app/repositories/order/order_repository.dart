import 'package:vakinha/app/models/order.dart';
import 'package:vakinha/app/models/order_pix.dart';

abstract class OrderRepository {
  //Contrato
  Future<OrderPix> createOrder(Order order);
}
