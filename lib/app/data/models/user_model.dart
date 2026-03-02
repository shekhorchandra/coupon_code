class UserModel {
  String? username;
  String? email;
  String? password;

  UserModel({this.username, this.email, this.password});

  // Convert JSON to UserModel
  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['user_name'];
    email = json['email'];
    password = json['password'];
  }

  // Convert UserModel to JSON
  Map<String, dynamic> toJson() {
    return {'username': username, 'email': email, 'password': password};
  }
}
