import 'package:cart_app/provider/cartController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogIn extends StatelessWidget {
  LogIn({Key? key}) : super(key: key);
  CartController controller = Get.put(CartController());
  final usernameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String user = "";
    String Email = "";

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Image.network(
                "https://i.pinimg.com/originals/e5/07/d7/e507d704d4b6fdcb17116762fcd99acd.gif"),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Fastest Delivery",
                      style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "We care about customer first.After submitting order,",
                        style: TextStyle(
                          color: Colors.blue.shade100,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "you will get your foods within 30mins.",
                      style: TextStyle(
                        color: Colors.blue.shade100,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Form(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            controller: usernameController,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blue.shade900,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.blue.shade900,
                                ),
                                suffixIconColor: Colors.blue,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                    width: 3,
                                  ),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            controller: emailController,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue.shade900,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.blue.shade900,
                              ),
                              suffixIconColor: Colors.blue,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 3,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    height: 60,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.blue.shade900,
                      ),
                    ),
                    color: Colors.blue.shade900,
                    onPressed: () {
                      Get.toNamed("/HomePage");
                      controller.username = usernameController.text.obs;
                      controller.email = emailController.text.obs;
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text("name ${controller.username.value}.."),
                  Text("last ${controller.email.value}.."),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
