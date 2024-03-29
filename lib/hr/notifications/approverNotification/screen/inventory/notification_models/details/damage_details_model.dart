// To parse this JSON data, do
//
//     final damageDetailsModel = damageDetailsModelFromJson(jsonString);

import 'dart:convert';

List<DamageDetailsModel> damageDetailsModelFromJson(String str) =>
    List<DamageDetailsModel>.from(
        json.decode(str).map((x) => DamageDetailsModel.fromJson(x)));

String damageDetailsModelToJson(List<DamageDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DamageDetailsModel {
  String xrow;
  String xunit;
  String xitem;
  String productName;
  String xprepqty;
  String xdphqty;
  String xnote;
  String xbrand;
  String damageQty;

  DamageDetailsModel({
    required this.xrow,
    required this.xunit,
    required this.xitem,
    required this.productName,
    required this.xprepqty,
    required this.xdphqty,
    required this.xnote,
    required this.xbrand,
    required this.damageQty,
  });

  factory DamageDetailsModel.fromJson(Map<String, dynamic> json) =>
      DamageDetailsModel(
        xrow: json["xrow"],
        xunit: json["xunit"],
        xitem: json["xitem"],
        productName: json["product_Name"],
        xprepqty: json["xprepqty"],
        xdphqty: json["xdphqty"],
        xnote: json["xnote"],
        xbrand: json["xbrand"],
        damageQty: json["damageQty"],
      );

  Map<String, dynamic> toJson() => {
        "xrow": xrow,
        "xunit": xunit,
        "xitem": xitem,
        "product_Name": productName,
        "xprepqty": xprepqty,
        "xdphqty": xdphqty,
        "xnote": xnote,
        "xbrand": xbrand,
        "damageQty": damageQty,
      };
}
