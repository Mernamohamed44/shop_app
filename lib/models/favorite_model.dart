class FavoritesModel {
  FavoritesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final dynamic message;
  final Data? data;

  FavoritesModel copyWith({
    bool? status,
    dynamic? message,
    Data? data,
  }) {
    return FavoritesModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  factory FavoritesModel.fromJson(Map<String, dynamic> json){
    return FavoritesModel(
      status: json["status"] ?? false,
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  final int currentPage;
  final List<Datum> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final dynamic nextPageUrl;
  final String path;
  final int perPage;
  final dynamic prevPageUrl;
  final int to;
  final int total;

  Data copyWith({
    int? currentPage,
    List<Datum>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    dynamic? nextPageUrl,
    String? path,
    int? perPage,
    dynamic? prevPageUrl,
    int? to,
    int? total,
  }) {
    return Data(
      currentPage: currentPage ?? this.currentPage,
      data: data ?? this.data,
      firstPageUrl: firstPageUrl ?? this.firstPageUrl,
      from: from ?? this.from,
      lastPage: lastPage ?? this.lastPage,
      lastPageUrl: lastPageUrl ?? this.lastPageUrl,
      nextPageUrl: nextPageUrl ?? this.nextPageUrl,
      path: path ?? this.path,
      perPage: perPage ?? this.perPage,
      prevPageUrl: prevPageUrl ?? this.prevPageUrl,
      to: to ?? this.to,
      total: total ?? this.total,
    );
  }

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      currentPage: json["current_page"] ?? 0,
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      firstPageUrl: json["first_page_url"] ?? "",
      from: json["from"] ?? 0,
      lastPage: json["last_page"] ?? 0,
      lastPageUrl: json["last_page_url"] ?? "",
      nextPageUrl: json["next_page_url"],
      path: json["path"] ?? "",
      perPage: json["per_page"] ?? 0,
      prevPageUrl: json["prev_page_url"],
      to: json["to"] ?? 0,
      total: json["total"] ?? 0,
    );
  }

}

class Datum {
  Datum({
    required this.id,
    required this.product,
  });

  final int id;
  final Product? product;

  Datum copyWith({
    int? id,
    Product? product,
  }) {
    return Datum(
      id: id ?? this.id,
      product: product ?? this.product,
    );
  }

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
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
    required this.name,
    required this.description,
  });

  final int id;
  final   price;
  final  oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;

  Product copyWith({
    int? id,
    int? price,
    int? oldPrice,
    int? discount,
    String? image,
    String? name,
    String? description,
  }) {
    return Product(
      id: id ?? this.id,
      price: price ?? this.price,
      oldPrice: oldPrice ?? this.oldPrice,
      discount: discount ?? this.discount,
      image: image ?? this.image,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json["id"] ?? 0,
      price: json["price"] ?? 0,
      oldPrice: json["old_price"] ?? 0,
      discount: json["discount"] ?? 0,
      image: json["image"] ?? "",
      name: json["name"] ?? "",
      description: json["description"] ?? "",
    );
  }

}
