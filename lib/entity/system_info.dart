import 'dart:convert';
import 'package:test_flutter/generated/json/base/json_field.dart';
import 'package:test_flutter/generated/json/system_info.g.dart';

@JsonSerializable()
class SystemInfo {

	String? author;
	List<SystemInfoChildren>? children;
	int? courseId;
	String? cover;
	String? desc;
	int? id;
	String? lisense;
	String? lisenseLink;
	String? name;
	int? order;
	int? parentChapterId;
	bool? userControlSetTop;
	int? visible;
  
  SystemInfo();

  factory SystemInfo.fromJson(Map<String, dynamic> json) => $SystemInfoFromJson(json);

  Map<String, dynamic> toJson() => $SystemInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SystemInfoChildren {

	String? author;
	List<dynamic>? children;
	int? courseId;
	String? cover;
	String? desc;
	int? id;
	String? lisense;
	String? lisenseLink;
	String? name;
	int? order;
	int? parentChapterId;
	bool? userControlSetTop;
	int? visible;
  
  SystemInfoChildren();

  factory SystemInfoChildren.fromJson(Map<String, dynamic> json) => $SystemInfoChildrenFromJson(json);

  Map<String, dynamic> toJson() => $SystemInfoChildrenToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}