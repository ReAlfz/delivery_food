class Menu {
  int? id;
  String? name;
  String? category;
  int? price;
  String? description;
  String? image;

  Menu({
    this.id,
    this.name,
    this.category,
    this.price,
    this.description,
    this.image,
  });

  Menu copyWith({
    int? id,
    String? name,
    String? category,
    int? price,
    String? description,
    String? image,
  }) =>
      Menu(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        price: price ?? this.price,
        description: description ?? this.description,
        image: image ?? this.image,
      );

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
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
