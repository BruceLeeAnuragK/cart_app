import 'dart:developer';

import 'package:cart_app/helper/api_helper.dart';
import 'package:cart_app/model/cart_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList<Product> productItems = <Product>[].obs;

  ProductController() {
    _addToProduct();
  }

  _addToProduct() async {
    productItems(await APIHelper.apiHelper.getData());
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
      filteredItems.assignAll(productItems);
      update();
    } else {
      var searchList = productItems
          .where((item) => item.brand
              .toLowerCase()
              .contains(searchQuery.value.toLowerCase()))
          .toList();
      productItems.assignAll(searchList);
      update();
    }
  }

  void sortCartByCategoryAscending() {
    productItems.sort((a, b) => b.category.compareTo(a.category));
    update();
  }

  // Sort cart items by category in descending order
  void sortCartByCategoryDescending() {
    productItems.sort((a, b) => a.category.compareTo(b.category));
    update();
  }

  // Sort cart items by brand in ascending order
  void sortCartByBrandAscending() {
    log("BEFORE===========");
    productItems.forEach((element) {
      log("P: ${element.title}");
    });
    productItems.sort((a, b) => b.title.compareTo(a.title));
    log("After===========");
    productItems.forEach((element) {
      log("P: ${element.title}");
    });
  }

  // Sort cart items by brand in descending order
  void sortCartByBrandDescending() {
    productItems.sort((a, b) => a.title.compareTo(b.title));
    update();
  }

  void setSearchQuery(String query) {
    searchQuery.value = query;
    update();
  }
}
