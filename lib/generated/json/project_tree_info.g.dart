import 'package:test_flutter/generated/json/base/json_convert_content.dart';
import 'package:test_flutter/entity/project_tree_info.dart';

ProjectTreeInfo $ProjectTreeInfoFromJson(Map<String, dynamic> json) {
	final ProjectTreeInfo projectTreeInfo = ProjectTreeInfo();
	final String? author = jsonConvert.convert<String>(json['author']);
	if (author != null) {
		projectTreeInfo.author = author;
	}
	final List<dynamic>? children = jsonConvert.convertListNotNull<dynamic>(json['children']);
	if (children != null) {
		projectTreeInfo.children = children;
	}
	final int? courseId = jsonConvert.convert<int>(json['courseId']);
	if (courseId != null) {
		projectTreeInfo.courseId = courseId;
	}
	final String? cover = jsonConvert.convert<String>(json['cover']);
	if (cover != null) {
		projectTreeInfo.cover = cover;
	}
	final String? desc = jsonConvert.convert<String>(json['desc']);
	if (desc != null) {
		projectTreeInfo.desc = desc;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		projectTreeInfo.id = id;
	}
	final String? lisense = jsonConvert.convert<String>(json['lisense']);
	if (lisense != null) {
		projectTreeInfo.lisense = lisense;
	}
	final String? lisenseLink = jsonConvert.convert<String>(json['lisenseLink']);
	if (lisenseLink != null) {
		projectTreeInfo.lisenseLink = lisenseLink;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		projectTreeInfo.name = name;
	}
	final int? order = jsonConvert.convert<int>(json['order']);
	if (order != null) {
		projectTreeInfo.order = order;
	}
	final int? parentChapterId = jsonConvert.convert<int>(json['parentChapterId']);
	if (parentChapterId != null) {
		projectTreeInfo.parentChapterId = parentChapterId;
	}
	final bool? userControlSetTop = jsonConvert.convert<bool>(json['userControlSetTop']);
	if (userControlSetTop != null) {
		projectTreeInfo.userControlSetTop = userControlSetTop;
	}
	final int? visible = jsonConvert.convert<int>(json['visible']);
	if (visible != null) {
		projectTreeInfo.visible = visible;
	}
	return projectTreeInfo;
}

Map<String, dynamic> $ProjectTreeInfoToJson(ProjectTreeInfo entity) {
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