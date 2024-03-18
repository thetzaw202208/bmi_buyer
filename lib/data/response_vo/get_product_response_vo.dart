// To parse this JSON data, do
//
//     final getProductResponseVo = getProductResponseVoFromJson(jsonString);

import 'dart:convert';

GetProductResponseVo getProductResponseVoFromJson(String str) => GetProductResponseVo.fromJson(json.decode(str));

String getProductResponseVoToJson(GetProductResponseVo data) => json.encode(data.toJson());

class GetProductResponseVo {
  int? code;
  String? message;
  GetProductData? data;

  GetProductResponseVo({
    this.code,
    this.message,
    this.data,
  });

  factory GetProductResponseVo.fromJson(Map<String, dynamic> json) => GetProductResponseVo(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? null : GetProductData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data?.toJson(),
  };
}

class GetProductData {
  List<ProductElement>? products;
  List<Measurement>? measurements;

  GetProductData({
    this.products,
    this.measurements,
  });

  factory GetProductData.fromJson(Map<String, dynamic> json) => GetProductData(
    products: json["products"] == null ? [] : List<ProductElement>.from(json["products"]!.map((x) => ProductElement.fromJson(x))),
    measurements: json["measurements"] == null ? [] : List<Measurement>.from(json["measurements"]!.map((x) => Measurement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    "measurements": measurements == null ? [] : List<dynamic>.from(measurements!.map((x) => x.toJson())),
  };
}

class Measurement {
  int? id;
  String? name;
  int? type;
  int? productCategoryId;
  dynamic createdAt;
  dynamic updatedAt;

  Measurement({
    this.id,
    this.name,
    this.type,
    this.productCategoryId,
    this.createdAt,
    this.updatedAt,
  });

  factory Measurement.fromJson(Map<String, dynamic> json) => Measurement(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    productCategoryId: json["product_category_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "product_category_id": productCategoryId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class ProductElement {
  int? id;
  int? productId;
  int? measurementId;
  int? productCategoryId;
  String? price;
  String? weight;
  dynamic image;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  Photo? photo;
  Measurement? measurement;
  ProductsDetails? product;
  ProductCategory? productCategory;
  List<Photo>? media;

  ProductElement({
    this.id,
    this.productId,
    this.measurementId,
    this.productCategoryId,
    this.price,
    this.weight,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.photo,
    this.measurement,
    this.product,
    this.productCategory,
    this.media,
  });

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
    id: json["id"],
    productId: json["product_id"],
    measurementId: json["measurement_id"],
    productCategoryId: json["product_category_id"],
    price: json["price"],
    weight: json["weight"],
    image: json["image"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
    photo: json["photo"] == null ? null : Photo.fromJson(json["photo"]),
    measurement: json["measurement"] == null ? null : Measurement.fromJson(json["measurement"]),
    product: json["product"] == null ? null : ProductsDetails.fromJson(json["product"]),
    productCategory: json["product_category"] == null ? null : ProductCategory.fromJson(json["product_category"]),
    media: json["media"] == null ? [] : List<Photo>.from(json["media"]!.map((x) => Photo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "measurement_id": measurementId,
    "product_category_id": productCategoryId,
    "price": price,
    "weight": weight,
    "image": image,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
    "photo": photo?.toJson(),
    "measurement": measurement?.toJson(),
    "product": product?.toJson(),
    "product_category": productCategory?.toJson(),
    "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x.toJson())),
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
class ProductsDetails {
  int? id;
  String? name;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  dynamic photo;
  List<dynamic>? media;

  ProductsDetails({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.photo,
    this.media,
  });

  factory ProductsDetails.fromJson(Map<String, dynamic> json) => ProductsDetails(
    id: json["id"],
    name: json["name"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
    photo: json["photo"],
    media: json["media"] == null ? [] : List<dynamic>.from(json["media"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
    "photo": photo,
    "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x)),
  };
}

class ProductCategory {
  int? id;
  String? name;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  ProductCategory({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) => ProductCategory(
    id: json["id"],
    name: json["name"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
  };
}
