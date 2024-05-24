// To parse this JSON data, do
//
//     final getProductResponseVo = getProductResponseVoFromJson(jsonString);

import 'dart:convert';

GetProductResponseVo getProductResponseVoFromJson(String str) => GetProductResponseVo.fromJson(json.decode(str));

String getProductResponseVoToJson(GetProductResponseVo data) => json.encode(data.toJson());

class GetProductResponseVo {
  int? code;
  String? message;
  ProductRespondData? data;

  GetProductResponseVo({
    this.code,
    this.message,
    this.data,
  });

  factory GetProductResponseVo.fromJson(Map<String, dynamic> json) => GetProductResponseVo(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? null : ProductRespondData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data?.toJson(),
  };
}

class ProductRespondData {
  List<ProductDetailsData>? products;

  ProductRespondData({
    this.products,
  });

  factory ProductRespondData.fromJson(Map<String, dynamic> json) => ProductRespondData(
    products: json["products"] == null ? [] : List<ProductDetailsData>.from(json["products"]!.map((x) => ProductDetailsData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
  };
}

class ProductDetailsData {
  String? productName;
  int? productId;
  int? productCategoryId;
  int? hasDeliveryType;
  Photo? photo;
  List<Measurement>? measurements;

  ProductDetailsData({
    this.productName,
    this.productId,
    this.productCategoryId,
    this.hasDeliveryType,
    this.photo,
    this.measurements,
  });

  factory ProductDetailsData.fromJson(Map<String, dynamic> json) => ProductDetailsData(
    productName: json["product_name"],
    productId: json["product_id"],
    productCategoryId: json["product_category_id"],
    hasDeliveryType: json["has_delivery_type"],
    photo: json["photo"] == null ? null : Photo.fromJson(json["photo"]),
    measurements: json["measurements"] == null ? [] : List<Measurement>.from(json["measurements"]!.map((x) => Measurement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "product_name": productName,
    "product_id": productId,
    "product_category_id": productCategoryId,
    "has_delivery_type": hasDeliveryType,
    "photo": photo?.toJson(),
    "measurements": measurements == null ? [] : List<dynamic>.from(measurements!.map((x) => x.toJson())),
  };
}

class Measurement {
  int? id;
  String? name;
  int? measurementId;
  String? price;

  Measurement({
    this.id,
    this.name,
    this.measurementId,
    this.price,
  });

  factory Measurement.fromJson(Map<String, dynamic> json) => Measurement(
    id: json["id"],
    name: json["name"],
    measurementId: json["measurement_id"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "measurement_id": measurementId,
    "price": price,
  };
}

class Photo {
  int? id;
  String? modelType;
  int? modelId;
  String? uuid;
  String? collectionName;
  String? name;
  String? fileName;
  String? mimeType;
  String? disk;
  String? conversionsDisk;
  int? size;
  List<dynamic>? manipulations;
  List<dynamic>? customProperties;
  GeneratedConversions? generatedConversions;
  List<dynamic>? responsiveImages;
  int? orderColumn;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? url;
  String? thumbnail;
  String? preview;
  String? originalUrl;
  String? previewUrl;

  Photo({
    this.id,
    this.modelType,
    this.modelId,
    this.uuid,
    this.collectionName,
    this.name,
    this.fileName,
    this.mimeType,
    this.disk,
    this.conversionsDisk,
    this.size,
    this.manipulations,
    this.customProperties,
    this.generatedConversions,
    this.responsiveImages,
    this.orderColumn,
    this.createdAt,
    this.updatedAt,
    this.url,
    this.thumbnail,
    this.preview,
    this.originalUrl,
    this.previewUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    id: json["id"],
    modelType: json["model_type"],
    modelId: json["model_id"],
    uuid: json["uuid"],
    collectionName: json["collection_name"],
    name: json["name"],
    fileName: json["file_name"],
    mimeType: json["mime_type"],
    disk: json["disk"],
    conversionsDisk: json["conversions_disk"],
    size: json["size"],
    manipulations: json["manipulations"] == null ? [] : List<dynamic>.from(json["manipulations"]!.map((x) => x)),
    customProperties: json["custom_properties"] == null ? [] : List<dynamic>.from(json["custom_properties"]!.map((x) => x)),
    generatedConversions: json["generated_conversions"] == null ? null : GeneratedConversions.fromJson(json["generated_conversions"]),
    responsiveImages: json["responsive_images"] == null ? [] : List<dynamic>.from(json["responsive_images"]!.map((x) => x)),
    orderColumn: json["order_column"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    url: json["url"],
    thumbnail: json["thumbnail"],
    preview: json["preview"],
    originalUrl: json["original_url"],
    previewUrl: json["preview_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "model_type": modelType,
    "model_id": modelId,
    "uuid": uuid,
    "collection_name": collectionName,
    "name": name,
    "file_name": fileName,
    "mime_type": mimeType,
    "disk": disk,
    "conversions_disk": conversionsDisk,
    "size": size,
    "manipulations": manipulations == null ? [] : List<dynamic>.from(manipulations!.map((x) => x)),
    "custom_properties": customProperties == null ? [] : List<dynamic>.from(customProperties!.map((x) => x)),
    "generated_conversions": generatedConversions?.toJson(),
    "responsive_images": responsiveImages == null ? [] : List<dynamic>.from(responsiveImages!.map((x) => x)),
    "order_column": orderColumn,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "url": url,
    "thumbnail": thumbnail,
    "preview": preview,
    "original_url": originalUrl,
    "preview_url": previewUrl,
  };
}

class GeneratedConversions {
  bool? thumb;
  bool? preview;

  GeneratedConversions({
    this.thumb,
    this.preview,
  });

  factory GeneratedConversions.fromJson(Map<String, dynamic> json) => GeneratedConversions(
    thumb: json["thumb"],
    preview: json["preview"],
  );

  Map<String, dynamic> toJson() => {
    "thumb": thumb,
    "preview": preview,
  };
}
