// To parse this JSON data, do
//
//     final homeResponse = homeResponseFromJson(jsonString);

import 'dart:convert';

VoucherResponse homeResponseFromJson(String str) =>
    VoucherResponse.fromJson(json.decode(str));

String homeResponseToJson(VoucherResponse data) => json.encode(data.toJson());

class VoucherResponse {
  int? status;
  String? message;
  List<VoucherModel>? data;

  VoucherResponse({
    this.status,
    this.message,
    this.data,
  });

  VoucherResponse copyWith({
    int? status,
    String? message,
    List<VoucherModel>? data,
  }) =>
      VoucherResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory VoucherResponse.fromJson(Map<String, dynamic> json) =>
      VoucherResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<VoucherModel>.from(
                json["data"]!.map((x) => VoucherModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class VoucherModel {
  int? id;
  String? name;
  int? price;
  bool? isDiscount;
  DateTime? startDate;
  DateTime? expDate;
  String? description;

  VoucherModel({
    this.id,
    this.name,
    this.price,
    this.isDiscount,
    this.startDate,
    this.expDate,
    this.description,
  });

  VoucherModel copyWith({
    int? id,
    String? name,
    int? price,
    bool? isDiscount,
    DateTime? startDate,
    DateTime? expDate,
    String? description,
  }) =>
      VoucherModel(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        isDiscount: isDiscount ?? this.isDiscount,
        startDate: startDate ?? this.startDate,
        expDate: expDate ?? this.expDate,
        description: description ?? this.description,
      );

  factory VoucherModel.fromJson(Map<String, dynamic> json) => VoucherModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        isDiscount: json["is_discount"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        expDate:
            json["exp_date"] == null ? null : DateTime.parse(json["exp_date"]),
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "is_discount": isDiscount,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "exp_date":
            "${expDate!.year.toString().padLeft(4, '0')}-${expDate!.month.toString().padLeft(2, '0')}-${expDate!.day.toString().padLeft(2, '0')}",
        "description": description,
      };
}
