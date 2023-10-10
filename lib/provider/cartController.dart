import 'package:cart_app/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  RxString username = "".obs;
  RxString email = "".obs;
  RxList<Product> cartitems = <Product>[].obs;
  RxList<Product> addtocart = <Product>[].obs;
  RxList<Product> favitems = <Product>[].obs;
  RxList<Product> addtofavitems = <Product>[].obs;
  TextEditingController searchController = TextEditingController();

  static final storage = GetStorage();

  void OnSubmit(String userName, String Email) {
    username.value = userName;
    email.value = Email;

    storage.write("userName", username.value);
    storage.write("email", email.value);
  }

  addToCart({required Product product}) {
    // cartitems.add(product);
    // addtocart.add(cartitems[index]);
    cartitems.add(product); // Add product directly to cartitems list
    addtocart
        .assignAll(cartitems); // Update addtocart with all items in cartitems
    update();

    update();
  }

  addToFavourite({required Product product}) {
    favitems.add(product); // Add product directly to cartitems list
    addtofavitems
        .assignAll(favitems); // Update addtocart with all items in cartitems
    update();
    update();
  }

  removeFromCart({required Product product}) {
    cartitems.remove(product); // Remove product directly from cartitems list
    addtocart.assignAll(cartitems); // Update addtocart with updated cartitems
    update();
    update();
  }

  removeToFavourite({required Product product}) {
    favitems.remove(product); // Remove product directly from cartitems list
    addtofavitems
        .assignAll(favitems); // Update addtocart with updated cartitems
    update();
    update();
  }

/////
  var searchQuery = ''.obs;
  RxList filteredItems = [].obs;

  void updateSearchQuery(String query) {
    searchQuery.value = query;
    filterSearchResults();
    update();
  }

  void filterSearchResults() {
    if (searchQuery.isEmpty) {
      filteredItems.assignAll(cartitems);
      update();
    } else {
      var searchList = cartitems
          .where((item) => item.brand
              .toLowerCase()
              .contains(searchQuery.value.toLowerCase()))
          .toList();
      filteredItems.assignAll(searchList);
      update();
    }
  }

  // Rx variable to store the sorting criteria
  RxString sortBy = ''.obs;

  // Function to update the sorting criteria
  void setSortBy(String criteria) {
    sortBy.value = criteria;
    update();
  }

  // Sort cart items by category in ascending order
  void sortCartByCategoryAscending() {
    cartitems.sort((a, b) => a.category.compareTo(b.category));
    update();
  }

  // Sort cart items by category in descending order
  void sortCartByCategoryDescending() {
    cartitems.sort((a, b) => b.category.compareTo(a.category));
    update();
  }

  // Sort cart items by brand in ascending order
  void sortCartByBrandAscending() {
    cartitems.sort((a, b) => a.title.compareTo(b.brand));
    update();
  }

  // Sort cart items by brand in descending order
  void sortCartByBrandDescending() {
    cartitems.sort((a, b) => b.title.compareTo(a.brand));
    update();
  }

  ///
  // Observe changes in the search query

  void setSearchQuery(String query) {
    searchQuery.value = query;
    update();
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
