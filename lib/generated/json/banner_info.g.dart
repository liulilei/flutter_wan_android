import 'package:test_flutter/generated/json/base/json_convert_content.dart';
import 'package:test_flutter/entity/banner_info.dart';

BannerInfo $BannerInfoFromJson(Map<String, dynamic> json) {
	final BannerInfo bannerInfo = BannerInfo();
	final String? desc = jsonConvert.convert<String>(json['desc']);
	if (desc != null) {
		bannerInfo.desc = desc;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		bannerInfo.id = id;
	}
	final String? imagePath = jsonConvert.convert<String>(json['imagePath']);
	if (imagePath != null) {
		bannerInfo.imagePath = imagePath;
	}
	final int? isVisible = jsonConvert.convert<int>(json['isVisible']);
	if (isVisible != null) {
		bannerInfo.isVisible = isVisible;
	}
	final int? order = jsonConvert.convert<int>(json['order']);
	if (order != null) {
		bannerInfo.order = order;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		bannerInfo.title = title;
	}
	final int? type = jsonConvert.convert<int>(json['type']);
	if (type != null) {
		bannerInfo.type = type;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		bannerInfo.url = url;
	}
	return bannerInfo;
}

Map<String, dynamic> $BannerInfoToJson(BannerInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['desc'] = entity.desc;
	data['id'] = entity.id;
	data['imagePath'] = entity.imagePath;
	data['isVisible'] = entity.isVisible;
	data['order'] = entity.order;
	data['title'] = entity.title;
	data['type'] = entity.type;
	data['url'] = entity.url;
	return data;
}