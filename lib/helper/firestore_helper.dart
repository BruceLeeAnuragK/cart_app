import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_model.dart';

class FireStoreHelper {
  FireStoreHelper._();

  static final FireStoreHelper storeHelper = FireStoreHelper._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String collection = "User";

  String colId = "Id";
  String colName = "name";
  String colAge = "age";

  String colusername = "username";
  String colemail = "email";

  addUser({required UserModel userModel}) {
    Map<String, dynamic> datas = {
      colusername: userModel.username,
      colemail: userModel.email,
    };
    firestore
        .collection(collection)
        .doc(userModel.username.toString())
        .set(datas);
  }

  getUser({required String username}) {
    firestore.collection(collection).doc(username.toString()).snapshots();
  }
}
