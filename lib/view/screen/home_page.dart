import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../provider/cartController.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.find();

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_sharp,
                color: Colors.white,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Cart App"),
              centerTitle: true,
              background: Image.network(
                "https://img.freepik.com/premium-photo/blue-shopping-bag-blue-background-top-view_93675-84297.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Card(
                child: ListTile(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
