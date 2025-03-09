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
  List<dynamic>? topping;

  MenuModel({
    this.id,
    this.name,
    this.category,
    this.price,
    this.description,
    this.image,
    this.note = '',
    this.topping,
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
    List<dynamic>? topping,
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
        topping:
            json["topping_menu"] == null ? [] : _parsing(json["topping_menu"]),
      );

  static List<dynamic> _parsing(List<dynamic> data) {
    if (data.isEmpty) {
      return [];
    }

    if (data[0] is Map<String, dynamic>) {
      return data.map((x) => ToppingMenu.fromJson(x)).toList();
    } else if (data[0] is int) {
      return List<int>.from(data);
    } else {
      throw Exception('Invalid topping format');
    }
  }

  Map<String, dynamic> toJson() {
    List<dynamic>? toppingJson;
    if (topping != null) {
      if (topping!.isNotEmpty && topping![0] is ToppingMenu) {
        toppingJson = topping!.map((x) => (x as ToppingMenu).toJson()).toList();
      } else if (topping!.isNotEmpty && topping![0] is int) {
        toppingJson = List<int>.from(topping!);
      }
    }
    return {
      "id": id,
      "name": name,
      "category": category,
      "price": price,
      "description": description,
      "image": image,
      "note": note ?? '',
      "quantity": quantity,
      "topping": topping == null ? [] : toppingJson,
    };
  }
}
