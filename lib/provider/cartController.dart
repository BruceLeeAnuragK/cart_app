import 'package:cart_app/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  RxString username = "".obs;
  RxString email = "".obs;
  RxList<Product> cartitems = <Product>[].obs;
  TextEditingController searchController = TextEditingController();

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

  var searchQuery = ''.obs;
  RxList filteredItems = [].obs;

  void updateSearchQuery(String query) {
    searchQuery.value = query;
    filterSearchResults();
  }

  void filterSearchResults() {
    if (searchQuery.isEmpty) {
      filteredItems.assignAll(cartitems);
    } else {
      var searchList = cartitems
          .where((item) => item.brand
              .toLowerCase()
              .contains(searchQuery.value.toLowerCase()))
          .toList();
      filteredItems.assignAll(searchList);
    }
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
