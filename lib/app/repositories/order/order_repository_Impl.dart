import 'dart:developer';

import 'package:vakinha/app/core/rest_client/rest_client.dart';
import 'package:vakinha/app/models/order_pix.dart';


import './order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final RestClient _restClient;

  OrderRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<OrderPix> createOrder(order) async {
    final result = await _restClient.post('/order/', {
      'userId': order.userId,
      'cpf': order.cpf,
      'address': order.address,
      'items': order.items
          .map((shoppingCard) => {
                'quantity': shoppingCard.quantity,
                'productId': shoppingCard.product.id
              })
          .toList(),
    });

    // final _dados = {
    //   'userId': order.userId,
    //   'cpf': order.cpf,
    //   'items': order.items
    //       .map((shoppingCard) => {
    //             'quantity': shoppingCard.quantity,
    //             'productId': shoppingCard.product.id,
    //           })
    //       .toList()
    // };
    // final result = await _restClient.post(
    //   '/order/',
    //   _dados,
    // );

    if (result.hasError) {
      log('Erro ao realizar pedido ${result.statusCode}',
          error: result.statusText, stackTrace: StackTrace.current);
      throw RestClientException('Erro ao realizar pedido');
    }
    return OrderPix.fromMap(result.body);
  }
}
