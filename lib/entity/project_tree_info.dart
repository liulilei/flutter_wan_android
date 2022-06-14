import 'dart:convert';
import 'package:test_flutter/generated/json/base/json_field.dart';
import 'package:test_flutter/generated/json/project_tree_info.g.dart';

@JsonSerializable()
class ProjectTreeInfo {

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
  
  ProjectTreeInfo();

  factory ProjectTreeInfo.fromJson(Map<String, dynamic> json) => $ProjectTreeInfoFromJson(json);

  Map<String, dynamic> toJson() => $ProjectTreeInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}