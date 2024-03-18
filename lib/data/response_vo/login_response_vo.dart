// To parse this JSON data, do
//
//     final loginResponseVo = loginResponseVoFromJson(jsonString);

import 'dart:convert';

LoginResponseVo loginResponseVoFromJson(String str) => LoginResponseVo.fromJson(json.decode(str));

String loginResponseVoToJson(LoginResponseVo data) => json.encode(data.toJson());

class LoginResponseVo {
  int? code;
  String? message;
  LoginResponseData? data;

  LoginResponseVo({
    this.code,
    this.message,
    this.data,
  });

  factory LoginResponseVo.fromJson(Map<String, dynamic> json) => LoginResponseVo(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? null : LoginResponseData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data?.toJson(),
  };
}

class LoginResponseData {
  int? id;
  String? name;
  String? password;
  String? address;
  String? phoneNo;
  int? buyerCategory;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  LoginResponseData({
    this.id,
    this.name,
    this.password,
    this.address,
    this.phoneNo,
    this.buyerCategory,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory LoginResponseData.fromJson(Map<String, dynamic> json) => LoginResponseData(
    id: json["id"],
    name: json["name"],
    password: json["password"],
    address: json["address"],
    phoneNo: json["phone_no"],
    buyerCategory: json["buyer_category"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "password": password,
    "address": address,
    "phone_no": phoneNo,
    "buyer_category": buyerCategory,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
