// To parse this JSON data, do
//
//     final orderListResponseVo = orderListResponseVoFromJson(jsonString);

import 'dart:convert';

OrderListResponseVo orderListResponseVoFromJson(String str) => OrderListResponseVo.fromJson(json.decode(str));

String orderListResponseVoToJson(OrderListResponseVo data) => json.encode(data.toJson());

class OrderListResponseVo {
  int? code;
  String? message;
  List<OrderListData>? data;

  OrderListResponseVo({
    this.code,
    this.message,
    this.data,
  });

  factory OrderListResponseVo.fromJson(Map<String, dynamic> json) => OrderListResponseVo(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<OrderListData>.from(json["data"]!.map((x) => OrderListData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class OrderListData {
  DateTime? orderDate;
  String? deliveryAddress;
  String? phoneNo;
  String? status;
  int? statusId;
  List<ProductOrderDetail>? productOrderDetails;

  OrderListData({
    this.orderDate,
    this.deliveryAddress,
    this.phoneNo,
    this.status,
    this.statusId,
    this.productOrderDetails,
  });

  factory OrderListData.fromJson(Map<String, dynamic> json) => OrderListData(
    orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
    deliveryAddress: json["delivery_address"],
    phoneNo: json["phone_no"],
    status: json["status"],
    statusId: json["status_id"],
    productOrderDetails: json["productOrderDetails"] == null ? [] : List<ProductOrderDetail>.from(json["productOrderDetails"]!.map((x) => ProductOrderDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "order_date": orderDate?.toIso8601String(),
    "delivery_address": deliveryAddress,
    "phone_no": phoneNo,
    "status": status,
    "status_id": statusId,
    "productOrderDetails": productOrderDetails == null ? [] : List<dynamic>.from(productOrderDetails!.map((x) => x.toJson())),
  };
}

class ProductOrderDetail {
  int? qty;
  int? totalAmount;
  String? productName;
  String? measurement;
  dynamic media;

  ProductOrderDetail({
    this.qty,
    this.totalAmount,
    this.productName,
    this.measurement,
    this.media,
  });

  factory ProductOrderDetail.fromJson(Map<String, dynamic> json) => ProductOrderDetail(
    qty: json["qty"],
    totalAmount: json["total_amount"],
    productName: json["product_name"],
    measurement: json["measurement"],
    media: json["media"],
  );

  Map<String, dynamic> toJson() => {
    "qty": qty,
    "total_amount": totalAmount,
    "product_name": productName,
    "measurement": measurement,
    "media": media,
  };
}
