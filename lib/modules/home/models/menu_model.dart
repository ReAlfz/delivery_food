import 'package:delivery_food/modules/detail_menu/models/detail_menu_model.dart';

class MenuModel {
  int? id;
  String? name;
  String? category;
  int? price;
  String? description;
  int quantity;
  String? image;
  String? note;
  List<ToppingMenu>? topping;

  MenuModel({
    this.id,
    this.name,
    this.category,
    this.price,
    this.description,
    this.image,
    this.topping,
    this.note,
    this.quantity = 0,
  });

  MenuModel copyWith({
    int? id,
    String? name,
    String? category,
    int? price,
    String? description,
    String? image,
    String? note,
    List<ToppingMenu>? topping,
    int? quantity,
  }) =>
      MenuModel(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        price: price ?? this.price,
        description: description ?? this.description,
        image: image ?? this.image,
        topping: topping ?? this.topping,
        note: note ?? this.note,
        quantity: quantity ?? this.quantity,
      );

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        price: json["price"],
        description: json["description"],
        image: json["image"],
        note: json["note"],
        quantity: json["quantity"] ?? 0,
        topping: json["topping_menu"] == null
            ? []
            : List<ToppingMenu>.from(
                json["topping_menu"].map((x) => ToppingMenu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "price": price,
        "description": description,
        "image": image,
        "note": note,
        "quantity": quantity,
        "topping": topping == null
            ? []
            : List<ToppingMenu>.from(topping!.map((x) => x)),
      };
}
