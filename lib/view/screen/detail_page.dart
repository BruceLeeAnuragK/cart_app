import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../provider/cartController.dart';
import '../../provider/productController.dart';

class ItemDetailPage extends StatelessWidget {
  ItemDetailPage({Key? key}) : super(key: key);

  ProductController controller = Get.find();
  int DetailIndex = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text(
          "Detail Page",
          style: GoogleFonts.sofia(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Obx(
          () => Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        controller.productItems[DetailIndex].thumbnail),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
