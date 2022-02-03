import 'dart:developer';

import 'package:vakinha/app/core/rest_client/rest_client.dart';
import 'package:vakinha/app/models/product_model.dart';
import 'package:vakinha/app/repositories/products/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RestClient _restClient;

  ProductRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<ProductModel>> findAll() async {
    final result = await _restClient.get('/products/');

    if (result.hasError) {
      var message = 'Erro ao buscar o produtos';
      log(message, error: result.statusText, stackTrace: StackTrace.current);
      throw RestClientException(message);
    }

    return result.body
        .map<ProductModel>((p) => ProductModel.fromMap(p))
        .toList();
  }
}
