class HomeModel {
  HomeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final dynamic message;
  final Data? data;

  HomeModel copyWith({
    bool? status,
    dynamic? message,
    Data? data,
  }) {
    return HomeModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  factory HomeModel.fromJson(Map<String, dynamic> json){
    return HomeModel(
      status: json["status"] ?? false,
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.banners,
    required this.products,
    required this.ad,
  });

  final List<Banner> banners;
  final List<Product> products;
  final String ad;

  Data copyWith({
    List<Banner>? banners,
    List<Product>? products,
    String? ad,
  }) {
    return Data(
      banners: banners ?? this.banners,
      products: products ?? this.products,
      ad: ad ?? this.ad,
    );
  }

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      banners: json["banners"] == null ? [] : List<Banner>.from(json["banners"]!.map((x) => Banner.fromJson(x))),
      products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
      ad: json["ad"] ?? "",
    );
  }

}

class Banner {
  Banner({
    required this.id,
    required this.image,
    required this.category,
    required this.product,
  });

  final int id;
  final String image;
  final dynamic category;
  final dynamic product;

  Banner copyWith({
    int? id,
    String? image,
    dynamic? category,
    dynamic? product,
  }) {
    return Banner(
      id: id ?? this.id,
      image: image ?? this.image,
      category: category ?? this.category,
      product: product ?? this.product,
    );
  }

  factory Banner.fromJson(Map<String, dynamic> json){
    return Banner(
      id: json["id"] ?? 0,
      image: json["image"] ?? "",
      category: json["category"],
      product: json["product"],
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
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  final int id;
  final price;
  final  oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;
  final List<String> images;
  final bool inFavorites;
  final bool inCart;

  Product copyWith({
    int? id,
    int? price,
    int? oldPrice,
    int? discount,
    String? image,
    String? name,
    String? description,
    List<String>? images,
    bool? inFavorites,
    bool? inCart,
  }) {
    return Product(
      id: id ?? this.id,
      price: price ?? this.price,
      oldPrice: oldPrice ?? this.oldPrice,
      discount: discount ?? this.discount,
      image: image ?? this.image,
      name: name ?? this.name,
      description: description ?? this.description,
      images: images ?? this.images,
      inFavorites: inFavorites ?? this.inFavorites,
      inCart: inCart ?? this.inCart,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json["id"] ?? 0,
      price: json["price"] ?? 0.toDouble(),
      oldPrice: json["old_price"] ?? 0.toDouble(),
      discount: json["discount"] ?? 0,
      image: json["image"] ?? "",
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
      inFavorites: json["in_favorites"] ?? false,
      inCart: json["in_cart"] ?? false,
    );
  }

}
