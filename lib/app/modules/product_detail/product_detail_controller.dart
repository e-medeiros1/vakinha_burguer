import 'package:get/get.dart';
import 'package:vakinha/app/core/services/shopping_card_service.dart';
import 'package:vakinha/app/models/product_model.dart';

class ProductDetailController extends GetxController {
  final _product = Rx<ProductModel>(Get.arguments);
  final _totalPrice = 0.0.obs;
  final _quantity = 1.obs;
  final ShoppingCardService _shoppingCardService;
  final _alreadyAdded = false.obs;

  ProductDetailController({
    required ShoppingCardService shoppingCardService,
  }) : _shoppingCardService = shoppingCardService;

  ProductModel get product => _product.value;
  double get totalPrice => _totalPrice.value;
  int get quantity => _quantity.value;
  bool get alreadyAdded => _alreadyAdded.value;

  @override
  void onInit() {
    super.onInit();
    _totalPrice(product.price);

    ever<int>(_quantity, (quantity) {
      _totalPrice(product.price * quantity);
    });

    final productShoppingCard = _shoppingCardService.getById(product.id);

    if (productShoppingCard != null) {
      _quantity(productShoppingCard.quantity);
      _alreadyAdded(true);
    }
  }

  void addProduct() {
    _quantity.value += 1;
  }

  void removeProduct() {
    if (_quantity > 1) {
      _quantity.value -= 1;
    }
  }

  void addProductInShoppingCard() {
    _shoppingCardService.addAndRemoveProductInShoppingCard(product,
        quantity: quantity);
    Get.back();
  }
}


//Faz com que os products estejam disponíveis
