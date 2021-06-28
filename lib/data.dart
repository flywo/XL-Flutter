import 'dart:convert';

/**
 * @ClassName: data
 * @Description:
 * @Author: yuhua
 * @CreateDate: 2021/6/21 4:29 PM
 */

List<XLData> xlDataFromJson(String str) => List<XLData>.from(json.decode(str).map((x) => XLData.fromJson(x)));

String xlDataToJson(List<XLData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class XLData {
  XLData({
    this.name,
    this.alias,
    this.feature,
    this.usage,
    this.choose,
    this.property,
    this.medication,
    this.place,
    this.tips,
  });

  String name;
  String alias;
  String feature;
  String usage;
  String choose;
  String property;
  String medication;
  String place;
  String tips;

  factory XLData.fromJson(Map<String, dynamic> json) => XLData(
    name: json["name"],
    alias: json["alias"],
    feature: json["feature"],
    usage: json["usage"],
    choose: json["choose"],
    property: json["property"],
    medication: json["medication"],
    place: json["place"],
    tips: json["tips"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "alias": alias,
    "feature": feature,
    "usage": usage,
    "choose": choose,
    "property": property,
    "medication": medication,
    "place": place,
    "tips": tips,
  };
}
