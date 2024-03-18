// To parse this JSON data, do
//
//     final registerVo = registerVoFromJson(jsonString);

import 'dart:convert';

RegisterVo registerVoFromJson(String str) => RegisterVo.fromJson(json.decode(str));

String registerVoToJson(RegisterVo data) => json.encode(data.toJson());

class RegisterVo {
  int? code;
  String? message;
  RegisterResponseData? data;

  RegisterVo({
    this.code,
    this.message,
    this.data,
  });

  factory RegisterVo.fromJson(Map<String, dynamic> json) => RegisterVo(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? null : RegisterResponseData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data?.toJson(),
  };
}

class RegisterResponseData {
  String? name;
  String? phoneNo;
  String? password;
  String? address;
  int? buyerCategory;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  RegisterResponseData({
    this.name,
    this.phoneNo,
    this.password,
    this.address,
    this.buyerCategory,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory RegisterResponseData.fromJson(Map<String, dynamic> json) => RegisterResponseData(
    name: json["name"],
    phoneNo: json["phone_no"],
    password: json["password"],
    address: json["address"],
    buyerCategory: json["buyer_category"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone_no": phoneNo,
    "password": password,
    "address": address,
    "buyer_category": buyerCategory,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "id": id,
  };
}
