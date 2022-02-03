import 'package:get/get.dart';
import 'package:vakinha/app/models/product_model.dart';

class ProductDetailController extends GetxController {
  final _product = Rx<ProductModel>(Get.arguments);
  final _totalPrice = 0.0.obs;
  final _quantity = 1.obs;

  ProductModel get product => _product.value;
  double get totalPrice => _totalPrice.value;
  int get quantity => _quantity.value;

  @override
  void onInit() {
    super.onInit();
    _totalPrice(product.price);

    ever<int>(_quantity, (quantity) {
      _totalPrice(product.price * quantity);
    });

    //Reatividade: Worker que toda vez que _quantity for alterado,
    //será feito uma atualização do _totalPrice
  }

  void addProduct() {
    _quantity.value += 1;
  }

  void removeProduct() {
    if (_quantity > 1) {
      _quantity.value -= 1;
    }
  }
}

//Faz com que os products estejam disponíveis
