import 'package:cart_app/view/screen/home_page.dart';
import 'package:cart_app/view/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      title: "Cart App",
      getPages: [
        GetPage(name: "/", page: () => LogIn()),
        GetPage(name: "/HomePage", page: () => HomePage()),
      ],
    );
  }
}
