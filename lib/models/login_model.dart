class LoginModel {
  LoginModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final Data? data;

  LoginModel copyWith({
    bool? status,
    String? message,
    Data? data,
  }) {
    return LoginModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  factory LoginModel.fromJson(Map<String, dynamic> json){
    return LoginModel(
      status: json["status"] ?? false,
      message: json["message"] ?? "",
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });

  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final int points;
  final int credit;
  final String token;

  Data copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? image,
    int? points,
    int? credit,
    String? token,
  }) {
    return Data(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      points: points ?? this.points,
      credit: credit ?? this.credit,
      token: token ?? this.token,
    );
  }

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      phone: json["phone"] ?? "",
      image: json["image"] ?? "",
      points: json["points"] ?? 0,
      credit: json["credit"] ?? 0,
      token: json["token"] ?? "",
    );
  }

}
