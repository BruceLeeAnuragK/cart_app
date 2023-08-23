import 'package:badges/badges.dart';
import 'package:cart_app/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helper/api_helper.dart';
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
                  badgeContent: Text("${controller.cartitems.length}"),
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
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverFillRemaining(
              child: Column(
                children: [
                  FutureBuilder(
                    future: APIHelper.apiHelper.getData(),
                    builder: (context, snapShot) {
                      if (snapShot.hasData) {
                        return Expanded(
                          child: GridView.builder(
                              itemCount: snapShot.data!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 10,
                              ),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 2,
                                          ),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(snapShot
                                                .data![index].thumbnail),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(snapShot.data![index].title),
                                    Text(snapShot.data![index].brand),
                                  ],
                                );
                              }),
                        );
                      } else if (snapShot.hasError) {
                        return Text("error ${snapShot.hasError}");
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
          ),
        ],
      ),
    );
  }
}
