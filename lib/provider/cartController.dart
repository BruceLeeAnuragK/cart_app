import 'package:cart_app/model/cart_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxString username = "".obs;
  RxString email = "".obs;
  RxList<Product> cartitems = <Product>[].obs;

  addToCart({required Product product}) {
    cartitems.add(product);
    update();
  }

  removeFromCart({required Product product}) {
    cartitems.remove(product);
    update();
  }
}
