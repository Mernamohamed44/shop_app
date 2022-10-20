class ChangeFavoritesModel {
  ChangeFavoritesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final Data? data;

  ChangeFavoritesModel copyWith({
    bool? status,
    String? message,
    Data? data,
  }) {
    return ChangeFavoritesModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  factory ChangeFavoritesModel.fromJson(Map<String, dynamic> json){
    return ChangeFavoritesModel(
      status: json["status"] ?? false,
      message: json["message"] ?? "",
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.id,
    required this.product,
  });

  final int id;
  final Product? product;

  Data copyWith({
    int? id,
    Product? product,
  }) {
    return Data(
      id: id ?? this.id,
      product: product ?? this.product,
    );
  }

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      id: json["id"] ?? 0,
      product: json["product"] == null ? null : Product.fromJson(json["product"]),
    );
  }

}

class Product {
  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
  });

  final int id;
  final int price;
  final int oldPrice;
  final int discount;
  final String image;

  Product copyWith({
    int? id,
    int? price,
    int? oldPrice,
    int? discount,
    String? image,
  }) {
    return Product(
      id: id ?? this.id,
      price: price ?? this.price,
      oldPrice: oldPrice ?? this.oldPrice,
      discount: discount ?? this.discount,
      image: image ?? this.image,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json["id"] ?? 0,
      price: json["price"] ?? 0,
      oldPrice: json["old_price"] ?? 0,
      discount: json["discount"] ?? 0,
      image: json["image"] ?? "",
    );
  }

}
