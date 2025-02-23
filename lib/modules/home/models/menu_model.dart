class MenuModel {
  int? id;
  String? name;
  String? category;
  int? price;
  String? description;
  String? image;

  MenuModel({
    this.id,
    this.name,
    this.category,
    this.price,
    this.description,
    this.image,
  });

  MenuModel copyWith({
    int? id,
    String? name,
    String? category,
    int? price,
    String? description,
    String? image,
  }) =>
      MenuModel(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        price: price ?? this.price,
        description: description ?? this.description,
        image: image ?? this.image,
      );

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        price: json["price"],
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "price": price,
        "description": description,
        "image": image,
      };
}
