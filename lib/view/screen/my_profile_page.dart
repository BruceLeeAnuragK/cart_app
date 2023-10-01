import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../provider/cartController.dart';

class MyProfilePage extends StatelessWidget {
  MyProfilePage({super.key});

  CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: GoogleFonts.sofia(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        leading: IconButton(
          onPressed: () {
            Get.find();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
    );
  }
}
