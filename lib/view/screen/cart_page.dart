import 'package:cart_app/provider/favController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/cart_model.dart';
import '../../provider/cartController.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);
  CartController controller = Get.find();
  FavController favController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text(
          "Cart Page",
          style: GoogleFonts.sofia(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: (controller.addtocart.isNotEmpty)
          ? ListView.builder(
              itemCount: controller.addtocart.length,
              itemBuilder: (context, index) {
                Product product = controller.addtocart[index];
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    height: 110,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(5, 5),
                            blurRadius: 10,
                            spreadRadius: 5),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: CircleAvatar(
                            radius: 30,
                            foregroundImage: NetworkImage(
                                controller.addtocart[index].thumbnail),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.addtocart[index].brand,
                                style: TextStyle(
                                  color: Colors.blue.shade900,
                                ),
                              ),
                              Text(
                                controller.addtocart[index].category,
                                style: TextStyle(
                                  color: Colors.blue.shade300,
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 25,
                                    width: 25,
                                    color: Colors.blue.shade900,
                                    alignment: Alignment.center,
                                    child: IconButton(
                                      iconSize: 10,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.add,
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "0",
                                      style: TextStyle(
                                          color: Colors.blue.shade300),
                                    ),
                                  ),
                                  Container(
                                    height: 25,
                                    width: 25,
                                    color: Colors.blue.shade900,
                                    margin: const EdgeInsets.all(5.0),
                                    child: IconButton(
                                      iconSize: 10,
                                      color: Colors.white,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.remove,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.favorite,
                                      size: 20,
                                      color: Colors.blue.shade900,
                                    ),
                                    onPressed: () {
                                      controller.addToFavourite(
                                          product: product);
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: IconButton(
                                    onPressed: () {
                                      bool remove = controller.removeFromCart(
                                          product: product);
                                      if (remove) {
                                        Get.snackbar("Sucessfully",
                                            "Your Cart Item is Removed");
                                      } else {
                                        Get.snackbar("Unsuccessfully",
                                            "Your Cart Item is NOT Removed");
                                      }
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.blue.shade900,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Non Items are Added to the Cart.",
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
// ListTile(
// leading: CircleAvatar(
// radius: 30,
// foregroundImage: NetworkImage(controller.cartitems[index].thumbnail),
// ),
// trailing: IconButton(
// onPressed: () {},
// icon: Icon(
// Icons.add,
// color: Colors.blue,
// ),
// ),
// title: Text("${controller.cartitems[index].brand}\n${controller.cartitems[index].category}"),
// subtitle: Row(
// children: [
//
// ],
// ),
// ),
