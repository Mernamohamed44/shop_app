class CategoriesModel {
  CategoriesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final dynamic message;
  final Data? data;

  CategoriesModel copyWith({
    bool? status,
    dynamic? message,
    Data? data,
  }) {
    return CategoriesModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  factory CategoriesModel.fromJson(Map<String, dynamic> json){
    return CategoriesModel(
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
    required this.name,
    required this.image,
  });

  final int id;
  final String name;
  final String image;

  Datum copyWith({
    int? id,
    String? name,
    String? image,
  }) {
    return Datum(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      image: json["image"] ?? "",
    );
  }

}
