import 'package:get/get.dart';

class SearchController extends GetxController {
  var searchQuery = ''.obs; // Observe changes in the search query

  void setSearchQuery(String query) {
    searchQuery.value = query;
  }
}
