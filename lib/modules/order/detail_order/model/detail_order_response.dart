// To parse this JSON data, do
//
//     final detailOrderResponse = detailOrderResponseFromJson(jsonString);

import 'dart:convert';

import 'package:delivery_food/modules/order/list_order/models/list_order_response.dart';

DetailOrderResponse detailOrderResponseFromJson(String str) =>
    DetailOrderResponse.fromJson(json.decode(str));

String detailOrderResponseToJson(DetailOrderResponse data) =>
    json.encode(data.toJson());

class DetailOrderResponse {
  int? status;
  String? message;
  OrderModel? data;

  DetailOrderResponse({
    this.status,
    this.message,
    this.data,
  });

  DetailOrderResponse copyWith({
    int? status,
    String? message,
    OrderModel? data,
  }) =>
      DetailOrderResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory DetailOrderResponse.fromJson(Map<String, dynamic> json) =>
      DetailOrderResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : OrderModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}
