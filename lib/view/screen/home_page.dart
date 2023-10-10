import 'package:cart_app/model/cart_model.dart';
import 'package:cart_app/provider/favController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helper/api_helper.dart';
import '../../provider/cartController.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  CartController controller = Get.put(CartController());
  FavController favController = Get.put(FavController());
  TextEditingController searchController = TextEditingController();

  void filterSearchResults() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(1),
                child: IconButton(
                  onPressed: () {
                    Get.toNamed("/CartPage");
                  },
                  icon: const Icon(
                    Icons.person_4_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1),
                child: IconButton(
                  onPressed: () {
                    Get.toNamed("/FavoiritePage");
                  },
                  icon: const Icon(
                    Icons.favorite_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1),
                child: Obx(() {
                  return Badge(
                    label: Text("${controller.cartitems.length}"),
                    child: IconButton(
                      onPressed: () {
                        Get.toNamed("/CartPage");
                      },
                      icon: const Icon(
                        Icons.shopping_cart_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  );
                }),
              ),
            ],
            leading: IconButton(
              icon: const Icon(
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
                  TextField(
                    onChanged: (val) {
                      controller.updateSearchQuery(val);
                    },
                    decoration: InputDecoration(
                      hintText: "Search...",
                      hintStyle: TextStyle(
                        color: Colors.blue.shade900,
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.blue.shade900,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Colors.blue.shade900, width: 1),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.5),
                                child: ElevatedButton(
                                  onPressed: () {
                                    controller.sortCartByBrandAscending();
                                  },
                                  child: Text(
                                    "A-Z",
                                    style: TextStyle(
                                      color: Colors.blue.shade900,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    controller.sortCartByBrandDescending();
                                  },
                                  child: Text(
                                    "Z-A",
                                    style: TextStyle(
                                      color: Colors.blue.shade900,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "By Brand Name :",
                            style: TextStyle(
                                color: Colors.blue.shade900, fontSize: 10),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            controller
                                                .sortCartByCategoryAscending();
                                          },
                                          child: Text(
                                            "A-Z",
                                            style: TextStyle(
                                              color: Colors.blue.shade900,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            controller
                                                .sortCartByCategoryDescending();
                                          },
                                          child: Text(
                                            "Z-A",
                                            style: TextStyle(
                                              color: Colors.blue.shade900,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "By Category Name :",
                                    style: TextStyle(
                                        color: Colors.blue.shade900,
                                        fontSize: 10),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  FutureBuilder(
                    future: APIHelper.apiHelper.getData(),
                    builder: (context, snapShot) {
                      if (snapShot.hasData) {
                        // Filter and sort the data before passing it to Obx
                        List<Product> filteredItems = snapShot.data!
                            .where((item) => item.brand.toLowerCase().contains(
                                controller.searchQuery.value.toLowerCase()))
                            .toList();

                        // Sort the filtered items based on the sorting criteria
                        filteredItems.sort((a, b) {
                          if (controller.sortBy.value == 'brand') {
                            return a.brand.compareTo(b.brand);
                          } else if (controller.sortBy.value == 'category') {
                            return a.category.compareTo(b.category);
                          }
                          return 0;
                        });
                        return
                            // if (controller.isSortByCategoryAscending.value) {
                            //   controller.cartitems.sort(
                            //       (a, b) => a.category.compareTo(b.category));
                            // } else {
                            //   controller.cartitems.sort(
                            //       (a, b) => b.category.compareTo(a.category));
                            // }

                            Expanded(
                          child: GridView.builder(
                            itemCount: snapShot.data!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 10,
                              childAspectRatio: 2 / 2.1,
                            ),
                            itemBuilder: (context, index) {
                              Product product = snapShot.data![index];
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(5, 5),
                                      spreadRadius: 5,
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed("ItemDetailPage",
                                            arguments: index);
                                      },
                                      child: Container(
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
                                                style: const TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 8,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
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
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: IconButton(
                                                onPressed: () {
                                                  print(
                                                      "Index before addToCart: $index");

                                                  controller.addToCart(
                                                    product: product,
                                                  );
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
                            },
                          ),
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
