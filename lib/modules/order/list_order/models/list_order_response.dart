// To parse this JSON data, do
//
//     final listOrderResponse = listOrderResponseFromJson(jsonString);

import 'dart:convert';

import 'package:delivery_food/modules/menu/list_menu/models/menu_model.dart';

ListOrderResponse listOrderResponseFromJson(String str) =>
    ListOrderResponse.fromJson(json.decode(str));

String listOrderResponseToJson(ListOrderResponse data) =>
    json.encode(data.toJson());

class ListOrderResponse {
  int? status;
  String? message;
  String? errors;
  List<OrderModel>? data;

  ListOrderResponse({
    this.status,
    this.message,
    this.errors,
    this.data,
  });

  ListOrderResponse copyWith({
    int? status,
    String? message,
    String? errors,
    List<OrderModel>? data,
  }) =>
      ListOrderResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
        errors: errors ?? this.errors,
      );

  factory ListOrderResponse.fromJson(Map<String, dynamic> json) =>
      ListOrderResponse(
        status: json["status"],
        message: json["message"],
        errors: json['errors'],
        data: json["data"] == null
            ? []
            : List<OrderModel>.from(
                json["data"]!.map((x) => OrderModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "errors": errors,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class OrderModel {
  int? id;
  String? noReceipt;
  int? totalPrice;
  DateTime? date;
  int? status;
  List<MenuModel>? menu;

  OrderModel({
    this.id,
    this.noReceipt,
    this.totalPrice,
    this.date,
    this.status,
    this.menu,
  });

  OrderModel copyWith({
    int? id,
    String? noReceipt,
    int? totalPrice,
    DateTime? date,
    int? status,
    List<MenuModel>? menu,
  }) =>
      OrderModel(
        id: id ?? this.id,
        noReceipt: noReceipt ?? this.noReceipt,
        totalPrice: totalPrice ?? this.totalPrice,
        date: date ?? this.date,
        status: status ?? this.status,
        menu: menu ?? this.menu,
      );

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        noReceipt: json["no_receipt"],
        totalPrice: json["total_price"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        status: json["status"],
        menu: json["menu"] == null
            ? []
            : List<MenuModel>.from(
                json["menu"]!.map((x) => MenuModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "no_receipt": noReceipt,
        "total_price": totalPrice,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "status": status,
        "menu": menu == null
            ? []
            : List<dynamic>.from(menu!.map((x) => x.toJson())),
      };
}
