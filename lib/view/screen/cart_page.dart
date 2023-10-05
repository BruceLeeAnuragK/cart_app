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
          icon: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: controller.cartitems.length,
        itemBuilder: (context, index) {
          Product product = controller.cartitems[index];
          return Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
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
                      foregroundImage:
                          NetworkImage(controller.cartitems[index].thumbnail),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          controller.cartitems[index].brand,
                          style: TextStyle(
                            color: Colors.blue.shade900,
                          ),
                        ),
                        Text(
                          controller.cartitems[index].category,
                          style: TextStyle(
                            color: Colors.blue.shade300,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              color: Colors.blue.shade900,
                            ),
                            IconButton(
                              color: Colors.blue.shade900,
                              onPressed: () {},
                              icon: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
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
                                favController.addToFavourite(
                                    product: product, index: index);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            height: 30,
                            width: 30,
                            child: IconButton(
                              onPressed: () {
                                controller.removeFromCart(
                                    product: product, index: index);
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
