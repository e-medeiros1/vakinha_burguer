import 'package:vakinha/app/models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> findAll();
}
