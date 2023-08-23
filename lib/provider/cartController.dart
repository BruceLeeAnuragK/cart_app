import 'package:cart_app/model/cart_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  RxString username = "".obs;
  RxString email = "".obs;
  RxList<Product> cartitems = <Product>[].obs;

  static final storage = GetStorage();

  void OnSubmit(String userName, String Email) {
    username.value = userName;
    email.value = Email;

    storage.write("userName", username.value);
    storage.write("email", email.value);
  }

  addToCart({required Product product}) {
    cartitems.add(product);
  }

  removeFromCart({required Product product}) {
    cartitems.remove(product);
  }

  // changeOty({required int val, required int index}) {
  //   if (cartitems[index].qty != null) {
  //     cartitems[index].qty += val;
  //     if (cartitems[index].qty < 1) {
  //       cartitems.removeAt(index);
  //     }
  //   }
  // }
}
