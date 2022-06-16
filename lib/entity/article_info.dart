import 'dart:convert';

import 'package:test_flutter/generated/json/article_info.g.dart';
import 'package:test_flutter/generated/json/base/json_field.dart';

@JsonSerializable()
class ArticleInfo {
  int? curPage;
  List<ArticleInfoDatas>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  ArticleInfo();

  factory ArticleInfo.fromJson(Map<String, dynamic> json) => $ArticleInfoFromJson(json);

  Map<String, dynamic> toJson() => $ArticleInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  ArticleInfo addData(ArticleInfo articleInfo, bool isRefresh) {
    curPage = articleInfo.curPage;
    offset = articleInfo.offset;
    over = articleInfo.over;
    pageCount = articleInfo.pageCount;
    size = articleInfo.size;
    total = articleInfo.total;
    if (isRefresh) {
      datas?.clear();
    }
    datas?.addAll(articleInfo.datas ?? []);
    return ArticleInfo();
  }
}

@JsonSerializable()
class ArticleInfoDatas {
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
  List<ArticleInfoDatasTags>? tags;
  String? title;
  int? type;
  int? userId;
  int? visible;
  int? zan;

  ArticleInfoDatas();

  factory ArticleInfoDatas.fromJson(Map<String, dynamic> json) => $ArticleInfoDatasFromJson(json);

  Map<String, dynamic> toJson() => $ArticleInfoDatasToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ArticleInfoDatasTags {
  String? name;
  String? url;

  ArticleInfoDatasTags();

  factory ArticleInfoDatasTags.fromJson(Map<String, dynamic> json) => $ArticleInfoDatasTagsFromJson(json);

  Map<String, dynamic> toJson() => $ArticleInfoDatasTagsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
