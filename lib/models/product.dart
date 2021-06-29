// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    this.productId,
    this.sku,
    this.name,
    this.productUrl,
    this.price,
    this.retailPrice,
    this.thumbnailUrl,
    this.searchKeywords,
    this.description,
    this.category,
    this.categoryId,
    this.brand,
    this.childSku,
    this.childPrice,
    this.color,
    this.colorFamily,
    this.colorSwatches,
    this.size,
    this.shoeSize,
    this.pantsSize,
    this.occassion,
    this.season,
    this.badges,
    this.ratingAvg,
    this.ratingCount,
    this.inventoryCount,
    this.dateCreated,
  });

  int? productId;
  String? sku;
  String? name;
  String? productUrl;
  double? price;
  double? retailPrice;
  String? thumbnailUrl;
  String? searchKeywords;
  String? description;
  String? category;
  dynamic categoryId;
  String? brand;
  String? childSku;
  String? childPrice;
  String? color;
  String? colorFamily;
  String? colorSwatches;
  String? size;
  String? shoeSize;
  String? pantsSize;
  String? occassion;
  String? season;
  String? badges;
  double? ratingAvg;
  int? ratingCount;
  int? inventoryCount;
  DateTime? dateCreated;
  bool isFavorite = false;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productId: json["Product ID"],
        sku: json["SKU"],
        name: json["Name"],
        productUrl: json["Product URL"],
        price: json["Price"].toDouble(),
        retailPrice: json["Retail Price"].toDouble(),
        thumbnailUrl: json["Thumbnail URL"],
        searchKeywords: json["Search Keywords"],
        description: json["Description"],
        category: json["Category"],
        categoryId: json["Category ID"],
        brand: json["Brand"],
        childSku: json["Child SKU"],
        childPrice: json["Child Price"],
        color: json["Color"],
        colorFamily: json["Color Family"],
        colorSwatches: json["Color Swatches"],
        size: json["Size"],
        shoeSize: json["Shoe Size"],
        pantsSize: json["Pants Size"],
        occassion: json["Occassion"],
        season: json["Season"],
        badges: json["Badges"],
        ratingAvg: json["Rating Avg"].toDouble(),
        ratingCount: json["Rating Count"],
        inventoryCount: json["Inventory Count"],
        dateCreated: DateTime.parse(json["Date Created"]),
      );

  Map<String, dynamic> toJson() => {
        "Product ID": productId,
        "SKU": sku,
        "Name": name,
        "Product URL": productUrl,
        "Price": price,
        "Retail Price": retailPrice,
        "Thumbnail URL": thumbnailUrl,
        "Search Keywords": searchKeywords,
        "Description": description,
        "Category": category,
        "Category ID": categoryId,
        "Brand": brand,
        "Child SKU": childSku,
        "Child Price": childPrice,
        "Color": color,
        "Color Family": colorFamily,
        "Color Swatches": colorSwatches,
        "Size": size,
        "Shoe Size": shoeSize,
        "Pants Size": pantsSize,
        "Occassion": occassion,
        "Season": season,
        "Badges": badges,
        "Rating Avg": ratingAvg,
        "Rating Count": ratingCount,
        "Inventory Count": inventoryCount,
        "Date Created": dateCreated!.toIso8601String(),
      };
}
