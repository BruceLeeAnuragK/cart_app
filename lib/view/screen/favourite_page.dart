import 'package:cart_app/provider/favController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoiritePage extends StatelessWidget {
  FavoiritePage({super.key});

  FavController favController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text(
          "Item Detail",
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
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  leading: CircleAvatar(
                    foregroundImage:
                        NetworkImage(favController.favitems[index].thumbnail),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      color: Colors.blue,
                    ),
                  ),
                  title: Text(
                      "${favController.favitems[index].brand}\n${favController.favitems[index].category}"),
                ),
              ),
            )
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
