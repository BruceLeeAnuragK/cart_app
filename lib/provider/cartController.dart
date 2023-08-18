import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxString username = "".obs;
  RxString email = "".obs;
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  void OnSubmit() {
    username.value = usernameController.text;
    email.value = emailController.text;
  }
}
