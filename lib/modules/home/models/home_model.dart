// To parse this JSON data, do
//
//     final homeResponse = homeResponseFromJson(jsonString);

import 'dart:convert';

import 'package:delivery_food/modules/home/models/menu_model.dart';

HomeResponse homeResponseFromJson(String str) =>
    HomeResponse.fromJson(json.decode(str));

String homeResponseToJson(HomeResponse data) => json.encode(data.toJson());

class HomeResponse {
  int? status;
  String? message;
  String? errors;
  int? page;
  List<MenuModel>? data;

  HomeResponse({
    this.status,
    this.message,
    this.page,
    this.errors,
    this.data,
  });

  HomeResponse copyWith({
    int? status,
    String? message,
    String? errors,
    int? page,
    List<MenuModel>? data,
  }) =>
      HomeResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        page: page ?? this.page,
        data: data ?? this.data,
        errors: errors ?? this.errors,
      );

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
        status: json["status"],
        message: json["message"],
        page: json["page"],
        errors: json["errors"],
        data: json["data"] == null
            ? []
            : List<MenuModel>.from(
                json["data"]!.map((x) => MenuModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "page": page,
        "errors": errors,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
