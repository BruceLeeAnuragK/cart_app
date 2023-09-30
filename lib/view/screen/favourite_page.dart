import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../provider/cartController.dart';

class FavoiritePage extends StatelessWidget {
  FavoiritePage({super.key});
  CartController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item Detail",style: GoogleFonts.sofia(color: Colors.white,),),
        centerTitle: true,
      ),
      body:ListView.builder(
        itemBuilder: (context, index) => Card(
          child: ListTile(
            leading: CircleAvatar(
              foregroundImage: NetworkImage(controller.cartitems[index].thumbnail),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                color: Colors.blue,
              ),
            ),
            title: Text("${controller.cartitems[index].brand}\n${controller.cartitems[index].category}"),
          ),
        ),
      ),
    );
  }
}
