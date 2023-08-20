import 'package:cart_app/helper/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../provider/cartController.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  CartController controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Badge(
                  backgroundColor: Colors.blue.shade400,
                  label: Text("3"),
                  textColor: Colors.blue.shade900,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_cart_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
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
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Cart App"),
              centerTitle: true,
              background: Image.network(
                "https://img.freepik.com/premium-photo/blue-shopping-bag-blue-background-top-view_93675-84297.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                FutureBuilder(
                  future: APIHelper.apiHelper.getData(),
                  builder: (context, snapShot) {
                    if (snapShot.hasData) {
                      return SliverGrid.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) => Card(
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  image: DecorationImage(
                                    image: NetworkImage(""),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                      );
                    } else if (snapShot.hasError) {
                      return Text("${snapShot.hasError}");
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue.shade900,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
