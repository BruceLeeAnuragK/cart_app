import 'package:cart_app/provider/favController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/cart_model.dart';

class FavoiritePage extends StatelessWidget {
  FavoiritePage({super.key});

  FavController favController = Get.find();

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
      body: (favController.favitems != null)
          ? ListView.builder(
              itemCount: favController.favitems.length,
              itemBuilder: (context, index) {
                Product product = favController.cartitems[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      foregroundImage:
                          NetworkImage(favController.favitems[index].thumbnail),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        favController.removeFromCart(product: product);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.blue.shade900,
                      ),
                    ),
                    title: Text(
                        "${favController.favitems[index].brand}\n${favController.favitems[index].category}"),
                  ),
                );
              })
          : Column(
              children: [
                Text(
                  "Non Items are Added to the Cart.",
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
    );
  }
}
