import 'package:cart_app/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
                child: Obx(() {
                  return Badge(
                    label: Text("${controller.cartitems.length}"),
                    child: IconButton(
                      onPressed: () {
                        Get.toNamed("/CartPage");
                      },
                      icon: Icon(
                        Icons.shopping_cart_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Obx(() {
                  return Badge(
                    label: Text("${controller.cartitems.length}"),
                    child: IconButton(
                      onPressed: () {
                        Get.toNamed("/CartPage");
                      },
                      icon: Icon(
                        Icons.sort,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  );
                }),
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
              title: Text(
                "Cart App",
                style: GoogleFonts.sofia(),
              ),
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
                                Product product = snapShot.data![index];
                                return Card(
                                  child: Column(
                                    children: [

                                      Container(
                                        height: 70,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image:
                                                NetworkImage(product.thumbnail),
                                          ),
                                        ),
                                      ),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  product.title,
                                                  style: TextStyle(
                                                    color: Colors.blue.shade900,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                                Text(
                                                  product.brand,
                                                  style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 8,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(child: CircleAvatar(
                                            backgroundColor: Colors.white,

                                            child: IconButton(
                                              icon: Icon(Icons.favorite,size: 20,color: Colors.blue.shade900,),
                                              onPressed: (){},
                                            ),
                                          )),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(bottom: 10),
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                child: IconButton(
                                                  onPressed: () {
                                                    controller.addToCart(
                                                        product: product);
                                                  },
                                                  icon: Icon(
                                                    Icons.shopping_cart,
                                                    color: Colors.blue.shade900,
                                                    size: 30,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },),
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
