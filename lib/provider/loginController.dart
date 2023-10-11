import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  RxString username = "".obs;
  RxString email = "".obs;

  static final storage = GetStorage();

  void OnSubmit(String userName, String Email) {
    username.value = userName;
    email.value = Email;

    storage.write("userName", username.value);
    storage.write("email", email.value);
  }
}
