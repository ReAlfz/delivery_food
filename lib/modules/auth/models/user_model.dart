// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

part 'user_model.g.dart';

RegisterModel loginFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String loginToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  int? status;
  String? accessToken;
  Errors? errors;
  UserModel? users;

  RegisterModel({
    this.status,
    this.accessToken,
    this.errors,
    this.users,
  });

  RegisterModel copyWith({
    int? status,
    String? message,
    String? accessToken,
    Errors? errors,
    UserModel? users,
  }) =>
      RegisterModel(
        status: status ?? this.status,
        accessToken: accessToken ?? this.accessToken,
        errors: errors ?? this.errors,
        users: users ?? this.users,
      );

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        status: json["status"],
        accessToken: json["access_token"],
        errors: json["errors"] == null ? null : Errors.fromJson(json["errors"]),
        users: json["users"] == null ? null : UserModel.fromJson(json["users"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "access_token": accessToken,
        "errors": errors?.toJson(),
        "users": users?.toJson(),
      };
}

class Errors {
  String? username;
  String? phone;
  String? password;

  Errors({
    this.username,
    this.phone,
    this.password,
  });

  Errors copyWith({
    String? username,
    String? phone,
    String? password,
  }) =>
      Errors(
        username: username ?? this.username,
        phone: phone ?? this.phone,
        password: password ?? this.password,
      );

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        username: json["username"],
        phone: json["phone"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "phone": phone,
        "password": password,
      };
}

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String? username;
  @HiveField(1)
  String? phone;
  @HiveField(2)
  DateTime? updatedAt;
  @HiveField(3)
  DateTime? createdAt;
  @HiveField(4)
  int? id;

  UserModel({
    this.username,
    this.phone,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  UserModel copyWith({
    String? username,
    String? phone,
    DateTime? updatedAt,
    DateTime? createdAt,
    int? id,
  }) =>
      UserModel(
        username: username ?? this.username,
        phone: phone ?? this.phone,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json["username"],
        phone: json["phone"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "phone": phone,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
