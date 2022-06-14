import 'dart:convert';
import 'package:test_flutter/generated/json/base/json_field.dart';
import 'package:test_flutter/generated/json/banner_info.g.dart';

@JsonSerializable()
class BannerInfo {

	String? desc;
	int? id;
	String? imagePath;
	int? isVisible;
	int? order;
	String? title;
	int? type;
	String? url;
  
  BannerInfo();

  factory BannerInfo.fromJson(Map<String, dynamic> json) => $BannerInfoFromJson(json);

  Map<String, dynamic> toJson() => $BannerInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}