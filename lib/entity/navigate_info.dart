import 'dart:convert';
import 'package:test_flutter/generated/json/base/json_field.dart';
import 'package:test_flutter/generated/json/navigate_info.g.dart';

@JsonSerializable()
class NavigateInfo {

	List<NavigateInfoArticles>? articles;
	int? cid;
	String? name;
  
  NavigateInfo();

  factory NavigateInfo.fromJson(Map<String, dynamic> json) => $NavigateInfoFromJson(json);

  Map<String, dynamic> toJson() => $NavigateInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NavigateInfoArticles {

	String? apkLink;
	int? audit;
	String? author;
	bool? canEdit;
	int? chapterId;
	String? chapterName;
	bool? collect;
	int? courseId;
	String? desc;
	String? descMd;
	String? envelopePic;
	bool? fresh;
	String? host;
	int? id;
	String? link;
	String? niceDate;
	String? niceShareDate;
	String? origin;
	String? prefix;
	String? projectLink;
	int? publishTime;
	int? realSuperChapterId;
	int? selfVisible;
	int? shareDate;
	String? shareUser;
	int? superChapterId;
	String? superChapterName;
	List<dynamic>? tags;
	String? title;
	int? type;
	int? userId;
	int? visible;
	int? zan;
  
  NavigateInfoArticles();

  factory NavigateInfoArticles.fromJson(Map<String, dynamic> json) => $NavigateInfoArticlesFromJson(json);

  Map<String, dynamic> toJson() => $NavigateInfoArticlesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}