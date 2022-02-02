// import 'dart:convert';

// class UserModel {
//   final String id;
//   final String name;
//   final String email;
//   final String password;
//   UserModel({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.password,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'email': email,
//       'password': password,
//     };
//   }

//   factory UserModel.fromMap(Map<String, dynamic> map) {
//     return UserModel(
//       id: map['id'] ?? '',
//       name: map['name'] ?? '',
//       email: map['email'] ?? '',
//       password: map['password'] ?? '',
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
// }

import 'dart:convert';

class UserModel {
  final int id;
  final String name;
  final String email;
  final String password;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "password": password,
    };
  }

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromMap(json.decode(str));

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        password: json['password'],
      );
}
