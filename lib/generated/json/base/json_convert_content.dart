// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/cupertino.dart';
import 'package:test_flutter/entity/article_info.dart';
import 'package:test_flutter/entity/banner_info.dart';
import 'package:test_flutter/entity/navigate_info.dart';
import 'package:test_flutter/entity/project_tree_info.dart';
import 'package:test_flutter/entity/system_info.dart';

JsonConvert jsonConvert = JsonConvert();
typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);

class JsonConvert {
	static final Map<String, JsonConvertFunction> _convertFuncMap = {
		(ArticleInfo).toString(): ArticleInfo.fromJson,
		(ArticleInfoDatas).toString(): ArticleInfoDatas.fromJson,
		(ArticleInfoDatasTags).toString(): ArticleInfoDatasTags.fromJson,
		(BannerInfo).toString(): BannerInfo.fromJson,
		(NavigateInfo).toString(): NavigateInfo.fromJson,
		(NavigateInfoArticles).toString(): NavigateInfoArticles.fromJson,
		(ProjectTreeInfo).toString(): ProjectTreeInfo.fromJson,
		(SystemInfo).toString(): SystemInfo.fromJson,
		(SystemInfoChildren).toString(): SystemInfoChildren.fromJson,
	};

  T? convert<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    return asT<T>(value);
  }

  List<T?>? convertList<T>(List<dynamic>? value) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => asT<T>(e)).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) => asT<T>(e)!).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  T? asT<T extends Object?>(dynamic value) {
    if (value is T) {
      return value;
    }
    final String type = T.toString();
    try {
      final String valueS = value.toString();
      if (type == "String") {
        return valueS as T;
      } else if (type == "int") {
        final int? intValue = int.tryParse(valueS);
        if (intValue == null) {
          return double.tryParse(valueS)?.toInt() as T?;
        } else {
          return intValue as T;
        }
      } else if (type == "double") {
        return double.parse(valueS) as T;
      } else if (type == "DateTime") {
        return DateTime.parse(valueS) as T;
      } else if (type == "bool") {
        if (valueS == '0' || valueS == '1') {
          return (valueS == '1') as T;
        }
        return (valueS == 'true') as T;
      } else if (type == "Map" || type.startsWith("Map<")) {
        return value as T;
      } else {
        if (_convertFuncMap.containsKey(type)) {
          return _convertFuncMap[type]!(value) as T;
        } else {
          throw UnimplementedError('$type unimplemented');
        }
      }
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return null;
    }
  }

	//list is returned by type
	static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
		if(<ArticleInfo>[] is M){
			return data.map<ArticleInfo>((Map<String, dynamic> e) => ArticleInfo.fromJson(e)).toList() as M;
		}
		if(<ArticleInfoDatas>[] is M){
			return data.map<ArticleInfoDatas>((Map<String, dynamic> e) => ArticleInfoDatas.fromJson(e)).toList() as M;
		}
		if(<ArticleInfoDatasTags>[] is M){
			return data.map<ArticleInfoDatasTags>((Map<String, dynamic> e) => ArticleInfoDatasTags.fromJson(e)).toList() as M;
		}
		if(<BannerInfo>[] is M){
			return data.map<BannerInfo>((Map<String, dynamic> e) => BannerInfo.fromJson(e)).toList() as M;
		}
		if(<NavigateInfo>[] is M){
			return data.map<NavigateInfo>((Map<String, dynamic> e) => NavigateInfo.fromJson(e)).toList() as M;
		}
		if(<NavigateInfoArticles>[] is M){
			return data.map<NavigateInfoArticles>((Map<String, dynamic> e) => NavigateInfoArticles.fromJson(e)).toList() as M;
		}
		if(<ProjectTreeInfo>[] is M){
			return data.map<ProjectTreeInfo>((Map<String, dynamic> e) => ProjectTreeInfo.fromJson(e)).toList() as M;
		}
		if(<SystemInfo>[] is M){
			return data.map<SystemInfo>((Map<String, dynamic> e) => SystemInfo.fromJson(e)).toList() as M;
		}
		if(<SystemInfoChildren>[] is M){
			return data.map<SystemInfoChildren>((Map<String, dynamic> e) => SystemInfoChildren.fromJson(e)).toList() as M;
		}

		debugPrint("${M.toString()} not found");
	
		return null;
}

	static M? fromJsonAsT<M>(dynamic json) {
		if (json is List) {
			return _getListChildType<M>(json.map((e) => e as Map<String, dynamic>).toList());
		} else {
			return jsonConvert.asT<M>(json);
		}
	}
}