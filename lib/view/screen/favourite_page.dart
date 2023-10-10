import 'package:cart_app/provider/cartController.dart';
import 'package:cart_app/provider/favController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/cart_model.dart';

class FavoiritePage extends StatelessWidget {
  FavoiritePage({super.key});

  FavController favController = Get.find();
  CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text(
          "Favourite",
          style: GoogleFonts.sofia(
            color: Colors.white,
          ),
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
      body: (cartController.addtofavitems.isNotEmpty)
          ? ListView.builder(
              itemCount: cartController.addtofavitems.length,
              itemBuilder: (context, index) {
                Product product = cartController.addtofavitems[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      foregroundImage: NetworkImage(
                          cartController.addtofavitems[index].thumbnail),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        cartController.removeToFavourite(product: product);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.blue.shade900,
                      ),
                    ),
                    title: Text(
                        "${cartController.addtofavitems[index].brand}\n${cartController.addtofavitems[index].category}"),
                  ),
                );
              },
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Non Items are Added to the Favourite.",
                  style: GoogleFonts.sofia(
                    color: Colors.blue.shade900,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
    );
  }
}
