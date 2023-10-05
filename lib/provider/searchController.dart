import 'package:cart_app/helper/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends ChangeNotifier {
  var searchQuery = ''.obs; // Observe changes in the search query

  void setSearchQuery(String query) {
    searchQuery.value = query;
  }

  initData() async {
    // Map data = await APIHelper.apiHelper.getData() ?? {};
  }
}
