// To parse this JSON data, do
//
//     final sprDetailsModel = sprDetailsModelFromJson(jsonString);

import 'dart:convert';

List<SprDetailsModel> sprDetailsModelFromJson(String str) =>
    List<SprDetailsModel>.from(
        json.decode(str).map((x) => SprDetailsModel.fromJson(x)));

String sprDetailsModelToJson(List<SprDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SprDetailsModel {
  String xrow;
  String xitem;
  String productName;
  String xqtyreq;
  String xavail;
  String xunit;

  SprDetailsModel({
    required this.xrow,
    required this.xitem,
    required this.productName,
    required this.xqtyreq,
    required this.xavail,
    required this.xunit,
  });

  factory SprDetailsModel.fromJson(Map<String, dynamic> json) =>
      SprDetailsModel(
        xrow: json["xrow"],
        xitem: json["xitem"],
        productName: json["product_Name"],
        xqtyreq: json["xqtyreq"],
        xavail: json["xavail"],
        xunit: json["xunit"],
      );

  Map<String, dynamic> toJson() => {
        "xrow": xrow,
        "xitem": xitem,
        "product_Name": productName,
        "xqtyreq": xqtyreq,
        "xavail": xavail,
        "xunit": xunit,
      };
}
