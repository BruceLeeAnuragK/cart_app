import 'package:cart_app/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavController extends GetxController {
  RxList<Product> favitems = <Product>[].obs;
  TextEditingController searchController = TextEditingController();

  addToFavourite({required Product product}) {
    favitems.add(product);
    update();
  }

  removeToFavourite({required Product product}) {
    favitems.remove(product);
    update();
  }
}
