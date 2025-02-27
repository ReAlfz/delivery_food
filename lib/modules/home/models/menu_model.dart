class MenuModel {
  int? id;
  String? name;
  String? category;
  int? price;
  String? description;
  int quantity;
  String? image;
  List<int>? topping;

  MenuModel({
    this.id,
    this.name,
    this.category,
    this.price,
    this.description,
    this.image,
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
    List<int>? topping,
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
        quantity: quantity ?? this.quantity,
      );

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
      id: json["id"],
      name: json["name"],
      category: json["category"],
      price: json["price"],
      description: json["description"],
      image: json["image"],
      topping: json["topping_menu"] == null
          ? []
          : List<int>.from(json["topping_menu"]!.map((x) => x)));

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "price": price,
        "description": description,
        "image": image,
        "topping":
            topping == null ? [] : List<dynamic>.from(topping!.map((x) => x)),
      };
}
