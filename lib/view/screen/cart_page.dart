import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../provider/cartController.dart';

class CratPage extends StatelessWidget {
  CratPage({Key? key}) : super(key: key);
  CartController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
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
        itemBuilder: (context, index) => Card(
          child: ListTile(
            leading: CircleAvatar(),
            trailing: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            title: Text(""),
          ),
        ),
      ),
    );
  }
}
