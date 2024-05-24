// To parse this JSON data, do
//
//     final productOrderRequestVo = productOrderRequestVoFromJson(jsonString);

import 'dart:convert';

ProductOrderRequestVo productOrderRequestVoFromJson(String str) => ProductOrderRequestVo.fromJson(json.decode(str));

String productOrderRequestVoToJson(ProductOrderRequestVo data) => json.encode(data.toJson());

class ProductOrderRequestVo {
  Orders? orders;
  List<Product>? products;

  ProductOrderRequestVo({
    this.orders,
    this.products,
  });

  factory ProductOrderRequestVo.fromJson(Map<String, dynamic> json) => ProductOrderRequestVo(
    orders: json["orders"] == null ? null : Orders.fromJson(json["orders"]),
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "orders": orders?.toJson(),
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
  };
}

class Orders {
  int? buyerId;
  DateTime? orderDate;
  String? deliveryAddress;
  String? phoneNo;
  int? deliveryType;

  Orders({
    this.buyerId,
    this.orderDate,
    this.deliveryAddress,
    this.phoneNo,
    this.deliveryType
  });

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
    buyerId: json["buyer_id"],
    orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
    deliveryAddress: json["delivery_address"],
    phoneNo: json["phone_no"],
    deliveryType: json["delivery_type"],
  );

  Map<String, dynamic> toJson() => {
    "buyer_id": buyerId,
    "order_date": orderDate?.toIso8601String(),
    "delivery_address": deliveryAddress,
    "phone_no": phoneNo,
    "delivery_type": deliveryType,
  };
}

class Product {
  int? productId;
  int? qty;
  int? totalAmount;
  int? measurementId;

  Product({
    this.productId,
    this.qty,
    this.totalAmount,
    this.measurementId,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
