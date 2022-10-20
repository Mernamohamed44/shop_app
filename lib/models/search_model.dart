class SearchModel {
  SearchModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final dynamic message;
  final Data? data;

  SearchModel copyWith({
    bool? status,
    dynamic? message,
    Data? data,
  }) {
    return SearchModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  factory SearchModel.fromJson(Map<String, dynamic> json){
    return SearchModel(
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
    required this.price,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  final int id;
  final  price;
  final String image;
  final String name;
  final String description;
  final List<String> images;
  final bool inFavorites;
  final bool inCart;

  Datum copyWith({
    int? id,
    int? price,
    String? image,
    String? name,
    String? description,
    List<String>? images,
    bool? inFavorites,
    bool? inCart,
  }) {
    return Datum(
      id: id ?? this.id,
      price: price ?? this.price,
      image: image ?? this.image,
      name: name ?? this.name,
      description: description ?? this.description,
      images: images ?? this.images,
      inFavorites: inFavorites ?? this.inFavorites,
      inCart: inCart ?? this.inCart,
    );
  }

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      id: json["id"] ?? 0,
      price: json["price"] ?? 0.toDouble(),
      image: json["image"] ?? "",
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
      inFavorites: json["in_favorites"] ?? false,
      inCart: json["in_cart"] ?? false,
    );
  }

}
