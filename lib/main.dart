import 'package:cart_app/helper/splash_screen_helper.dart';
import 'package:cart_app/view/screen/cart_page.dart';
import 'package:cart_app/view/screen/detail_page.dart';
import 'package:cart_app/view/screen/favourite_page.dart';
import 'package:cart_app/view/screen/home_page.dart';
import 'package:cart_app/view/screen/login_screen.dart';
import 'package:cart_app/view/screen/my_profile_page.dart';
import 'package:cart_app/view/screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => SearchController(),
      child: const MyApp(),
    ),
  );
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
        GetPage(
          name: "/",
          page: () => StorageHelper.storageHelper.isFirstItem
              ? SplashScreen()
              : LogIn(),
        ),
        GetPage(
          name: "/HomePage",
          page: () => HomePage(),
        ),
        GetPage(
          name: "/CartPage",
          page: () => CartPage(),
        ),
        GetPage(
          name: "/ItemDetailPage",
          page: () => ItemDetailPage(),
        ),
        GetPage(
          name: "/FavoiritePage",
          page: () => FavoiritePage(),
        ),
        GetPage(
          name: "/MyProfilePage",
          page: () => MyProfilePage(),
        ),
      ],
    );
  }
}
