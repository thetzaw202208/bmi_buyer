// To parse this JSON data, do
//
//     final productOrderResponseVo = productOrderResponseVoFromJson(jsonString);

import 'dart:convert';

ProductOrderResponseVo productOrderResponseVoFromJson(String str) => ProductOrderResponseVo.fromJson(json.decode(str));

String productOrderResponseVoToJson(ProductOrderResponseVo data) => json.encode(data.toJson());

class ProductOrderResponseVo {
  int? code;
  String? message;
  List<ProductOrderData>? data;

  ProductOrderResponseVo({
    this.code,
    this.message,
    this.data,
  });

  factory ProductOrderResponseVo.fromJson(Map<String, dynamic> json) => ProductOrderResponseVo(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<ProductOrderData>.from(json["data"]!.map((x) => ProductOrderData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ProductOrderData {
  int? productId;
  int? qty;
  int? totalAmount;
  int? measurementId;

  ProductOrderData({
    this.productId,
    this.qty,
    this.totalAmount,
    this.measurementId,
  });

  factory ProductOrderData.fromJson(Map<String, dynamic> json) => ProductOrderData(
    productId: json["product_id"],
    qty: json["qty"],
    totalAmount: json["total_amount"],
    measurementId: json["measurement_id"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "qty": qty,
    "total_amount": totalAmount,
    "measurement_id": measurementId,
  };
}
