import 'package:delivery_food/modules/menu/list_menu/models/menu_model.dart';

class DetailMenuResponse {
  int? status;
  String? message;
  String? errors;
  MenuModel? data;

  DetailMenuResponse({
    this.status,
    this.message,
    this.errors,
    this.data,
  });

  DetailMenuResponse copyWith({
    int? status,
    String? message,
    String? errors,
    MenuModel? data,
  }) =>
      DetailMenuResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        errors: errors ?? this.errors,
        data: data ?? this.data,
      );

  factory DetailMenuResponse.fromJson(Map<String, dynamic> json) =>
      DetailMenuResponse(
        status: json["status"],
        message: json["message"],
        errors: json["errors"],
        data: json["data"] == null ? null : MenuModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "errors": errors,
        "data": data?.toJson(),
      };
}

class ToppingMenu {
  int? id;
  String? name;
  int? price;
  int? menuId;
  int? toppingId;

  ToppingMenu({
    this.id,
    this.name,
    this.price,
    this.menuId,
    this.toppingId,
  });

  ToppingMenu copyWith({
    int? id,
    String? name,
    int? price,
    int? menuId,
    int? toppingId,
  }) =>
      ToppingMenu(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        menuId: menuId ?? this.menuId,
        toppingId: toppingId ?? this.toppingId,
      );

  factory ToppingMenu.fromJson(Map<String, dynamic> json) => ToppingMenu(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        menuId: json["menu_id"],
        toppingId: json["topping_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "menu_id": menuId,
        "topping_id": toppingId,
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ToppingMenu &&
        other.id == id &&
        other.name == name &&
        other.price == price &&
        other.menuId == menuId &&
        other.toppingId == toppingId;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      price.hashCode ^
      menuId.hashCode ^
      toppingId.hashCode;
}
