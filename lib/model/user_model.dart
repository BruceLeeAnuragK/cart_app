class UserModel {
  String username;
  String email;

  UserModel({
    required this.username,
    required this.email,
  });

  factory UserModel.fromMap({required Map data}) => UserModel(
        username: data['username'],
        email: data['email'],
      );
}

class User {
  int? id;
  String? name;
  String? email;
  String? image;
}
