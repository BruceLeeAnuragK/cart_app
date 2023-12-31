import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/firestore_helper.dart';
import '../../model/user_model.dart';
import '../../provider/loginController.dart';

class LogIn extends StatelessWidget {
  LogIn({Key? key}) : super(key: key);
  LoginController controller = Get.put(LoginController());
  final usernameController = TextEditingController();
  final emailController = TextEditingController();

  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                      "you will get your product within 30mins.",
                      style: TextStyle(
                        color: Colors.blue.shade100,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Form(
                    key: loginKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            controller: usernameController,
                            keyboardType: TextInputType.name,
                            validator: (val) {
                              if (val!.isEmpty) {
                                "Enter the User name.";
                              } else if (val.length > 6) {
                                "Enter only 6 digit username.";
                              } else {
                                "";
                              }
                            },
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
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            controller: emailController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                "Enter the your Email here.";
                              } else if (val.length > 6) {
                                "Enter only 6 digit username";
                              } else {
                                "";
                              }
                            },
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
                    onPressed: () async {
                      await FireStoreHelper.storeHelper.addUser(
                        userModel: UserModel(
                          username: usernameController.text,
                          email: emailController.text,
                        ),
                      );
                      Get.toNamed("/HomePage");
                      if (loginKey.currentState!.validate()) {
                        controller.OnSubmit(
                            usernameController.text, emailController.text);
                        usernameController.clear();
                        emailController.clear();
                      } else {
                        "not saved";
                      }
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
                  // Obx(
                  //   () => Text("name : ${controller.username.value}"),
                  // ),
                  // Obx(
                  //   () => Text("last : ${controller.email.value}"),
                  // ),
                  Text(
                      "User Name : ${LoginController.storage.read("userName") ?? ""}"),
                  Text(
                      " Email : ${LoginController.storage.read("email") ?? ""}"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
