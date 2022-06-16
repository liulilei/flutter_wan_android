import 'package:test_flutter/generated/json/base/json_convert_content.dart';
import 'package:test_flutter/entity/system_info.dart';

SystemInfo $SystemInfoFromJson(Map<String, dynamic> json) {
	final SystemInfo systemInfo = SystemInfo();
	final String? author = jsonConvert.convert<String>(json['author']);
	if (author != null) {
		systemInfo.author = author;
	}
	final List<SystemInfoChildren>? children = jsonConvert.convertListNotNull<SystemInfoChildren>(json['children']);
	if (children != null) {
		systemInfo.children = children;
	}
	final int? courseId = jsonConvert.convert<int>(json['courseId']);
	if (courseId != null) {
		systemInfo.courseId = courseId;
	}
	final String? cover = jsonConvert.convert<String>(json['cover']);
	if (cover != null) {
		systemInfo.cover = cover;
	}
	final String? desc = jsonConvert.convert<String>(json['desc']);
	if (desc != null) {
		systemInfo.desc = desc;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		systemInfo.id = id;
	}
	final String? lisense = jsonConvert.convert<String>(json['lisense']);
	if (lisense != null) {
		systemInfo.lisense = lisense;
	}
	final String? lisenseLink = jsonConvert.convert<String>(json['lisenseLink']);
	if (lisenseLink != null) {
		systemInfo.lisenseLink = lisenseLink;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		systemInfo.name = name;
	}
	final int? order = jsonConvert.convert<int>(json['order']);
	if (order != null) {
		systemInfo.order = order;
	}
	final int? parentChapterId = jsonConvert.convert<int>(json['parentChapterId']);
	if (parentChapterId != null) {
		systemInfo.parentChapterId = parentChapterId;
	}
	final bool? userControlSetTop = jsonConvert.convert<bool>(json['userControlSetTop']);
	if (userControlSetTop != null) {
		systemInfo.userControlSetTop = userControlSetTop;
	}
	final int? visible = jsonConvert.convert<int>(json['visible']);
	if (visible != null) {
		systemInfo.visible = visible;
	}
	return systemInfo;
}

Map<String, dynamic> $SystemInfoToJson(SystemInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['author'] = entity.author;
	data['children'] =  entity.children?.map((v) => v.toJson()).toList();
	data['courseId'] = entity.courseId;
	data['cover'] = entity.cover;
	data['desc'] = entity.desc;
	data['id'] = entity.id;
	data['lisense'] = entity.lisense;
	data['lisenseLink'] = entity.lisenseLink;
	data['name'] = entity.name;
	data['order'] = entity.order;
	data['parentChapterId'] = entity.parentChapterId;
	data['userControlSetTop'] = entity.userControlSetTop;
	data['visible'] = entity.visible;
	return data;
}

SystemInfoChildren $SystemInfoChildrenFromJson(Map<String, dynamic> json) {
	final SystemInfoChildren systemInfoChildren = SystemInfoChildren();
	final String? author = jsonConvert.convert<String>(json['author']);
	if (author != null) {
		systemInfoChildren.author = author;
	}
	final List<dynamic>? children = jsonConvert.convertListNotNull<dynamic>(json['children']);
	if (children != null) {
		systemInfoChildren.children = children;
	}
	final int? courseId = jsonConvert.convert<int>(json['courseId']);
	if (courseId != null) {
		systemInfoChildren.courseId = courseId;
	}
	final String? cover = jsonConvert.convert<String>(json['cover']);
	if (cover != null) {
		systemInfoChildren.cover = cover;
	}
	final String? desc = jsonConvert.convert<String>(json['desc']);
	if (desc != null) {
		systemInfoChildren.desc = desc;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		systemInfoChildren.id = id;
	}
	final String? lisense = jsonConvert.convert<String>(json['lisense']);
	if (lisense != null) {
		systemInfoChildren.lisense = lisense;
	}
	final String? lisenseLink = jsonConvert.convert<String>(json['lisenseLink']);
	if (lisenseLink != null) {
		systemInfoChildren.lisenseLink = lisenseLink;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		systemInfoChildren.name = name;
	}
	final int? order = jsonConvert.convert<int>(json['order']);
	if (order != null) {
		systemInfoChildren.order = order;
	}
	final int? parentChapterId = jsonConvert.convert<int>(json['parentChapterId']);
	if (parentChapterId != null) {
		systemInfoChildren.parentChapterId = parentChapterId;
	}
	final bool? userControlSetTop = jsonConvert.convert<bool>(json['userControlSetTop']);
	if (userControlSetTop != null) {
		systemInfoChildren.userControlSetTop = userControlSetTop;
	}
	final int? visible = jsonConvert.convert<int>(json['visible']);
	if (visible != null) {
		systemInfoChildren.visible = visible;
	}
	return systemInfoChildren;
}

Map<String, dynamic> $SystemInfoChildrenToJson(SystemInfoChildren entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['author'] = entity.author;
	data['children'] =  entity.children;
	data['courseId'] = entity.courseId;
	data['cover'] = entity.cover;
	data['desc'] = entity.desc;
	data['id'] = entity.id;
	data['lisense'] = entity.lisense;
	data['lisenseLink'] = entity.lisenseLink;
	data['name'] = entity.name;
	data['order'] = entity.order;
	data['parentChapterId'] = entity.parentChapterId;
	data['userControlSetTop'] = entity.userControlSetTop;
	data['visible'] = entity.visible;
	return data;
}