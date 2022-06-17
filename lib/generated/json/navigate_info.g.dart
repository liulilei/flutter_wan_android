import 'package:test_flutter/generated/json/base/json_convert_content.dart';
import 'package:test_flutter/entity/navigate_info.dart';

NavigateInfo $NavigateInfoFromJson(Map<String, dynamic> json) {
	final NavigateInfo navigateInfo = NavigateInfo();
	final List<NavigateInfoArticles>? articles = jsonConvert.convertListNotNull<NavigateInfoArticles>(json['articles']);
	if (articles != null) {
		navigateInfo.articles = articles;
	}
	final int? cid = jsonConvert.convert<int>(json['cid']);
	if (cid != null) {
		navigateInfo.cid = cid;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		navigateInfo.name = name;
	}
	return navigateInfo;
}

Map<String, dynamic> $NavigateInfoToJson(NavigateInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['articles'] =  entity.articles?.map((v) => v.toJson()).toList();
	data['cid'] = entity.cid;
	data['name'] = entity.name;
	return data;
}

NavigateInfoArticles $NavigateInfoArticlesFromJson(Map<String, dynamic> json) {
	final NavigateInfoArticles navigateInfoArticles = NavigateInfoArticles();
	final String? apkLink = jsonConvert.convert<String>(json['apkLink']);
	if (apkLink != null) {
		navigateInfoArticles.apkLink = apkLink;
	}
	final int? audit = jsonConvert.convert<int>(json['audit']);
	if (audit != null) {
		navigateInfoArticles.audit = audit;
	}
	final String? author = jsonConvert.convert<String>(json['author']);
	if (author != null) {
		navigateInfoArticles.author = author;
	}
	final bool? canEdit = jsonConvert.convert<bool>(json['canEdit']);
	if (canEdit != null) {
		navigateInfoArticles.canEdit = canEdit;
	}
	final int? chapterId = jsonConvert.convert<int>(json['chapterId']);
	if (chapterId != null) {
		navigateInfoArticles.chapterId = chapterId;
	}
	final String? chapterName = jsonConvert.convert<String>(json['chapterName']);
	if (chapterName != null) {
		navigateInfoArticles.chapterName = chapterName;
	}
	final bool? collect = jsonConvert.convert<bool>(json['collect']);
	if (collect != null) {
		navigateInfoArticles.collect = collect;
	}
	final int? courseId = jsonConvert.convert<int>(json['courseId']);
	if (courseId != null) {
		navigateInfoArticles.courseId = courseId;
	}
	final String? desc = jsonConvert.convert<String>(json['desc']);
	if (desc != null) {
		navigateInfoArticles.desc = desc;
	}
	final String? descMd = jsonConvert.convert<String>(json['descMd']);
	if (descMd != null) {
		navigateInfoArticles.descMd = descMd;
	}
	final String? envelopePic = jsonConvert.convert<String>(json['envelopePic']);
	if (envelopePic != null) {
		navigateInfoArticles.envelopePic = envelopePic;
	}
	final bool? fresh = jsonConvert.convert<bool>(json['fresh']);
	if (fresh != null) {
		navigateInfoArticles.fresh = fresh;
	}
	final String? host = jsonConvert.convert<String>(json['host']);
	if (host != null) {
		navigateInfoArticles.host = host;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		navigateInfoArticles.id = id;
	}
	final String? link = jsonConvert.convert<String>(json['link']);
	if (link != null) {
		navigateInfoArticles.link = link;
	}
	final String? niceDate = jsonConvert.convert<String>(json['niceDate']);
	if (niceDate != null) {
		navigateInfoArticles.niceDate = niceDate;
	}
	final String? niceShareDate = jsonConvert.convert<String>(json['niceShareDate']);
	if (niceShareDate != null) {
		navigateInfoArticles.niceShareDate = niceShareDate;
	}
	final String? origin = jsonConvert.convert<String>(json['origin']);
	if (origin != null) {
		navigateInfoArticles.origin = origin;
	}
	final String? prefix = jsonConvert.convert<String>(json['prefix']);
	if (prefix != null) {
		navigateInfoArticles.prefix = prefix;
	}
	final String? projectLink = jsonConvert.convert<String>(json['projectLink']);
	if (projectLink != null) {
		navigateInfoArticles.projectLink = projectLink;
	}
	final int? publishTime = jsonConvert.convert<int>(json['publishTime']);
	if (publishTime != null) {
		navigateInfoArticles.publishTime = publishTime;
	}
	final int? realSuperChapterId = jsonConvert.convert<int>(json['realSuperChapterId']);
	if (realSuperChapterId != null) {
		navigateInfoArticles.realSuperChapterId = realSuperChapterId;
	}
	final int? selfVisible = jsonConvert.convert<int>(json['selfVisible']);
	if (selfVisible != null) {
		navigateInfoArticles.selfVisible = selfVisible;
	}
	final int? shareDate = jsonConvert.convert<int>(json['shareDate']);
	if (shareDate != null) {
		navigateInfoArticles.shareDate = shareDate;
	}
	final String? shareUser = jsonConvert.convert<String>(json['shareUser']);
	if (shareUser != null) {
		navigateInfoArticles.shareUser = shareUser;
	}
	final int? superChapterId = jsonConvert.convert<int>(json['superChapterId']);
	if (superChapterId != null) {
		navigateInfoArticles.superChapterId = superChapterId;
	}
	final String? superChapterName = jsonConvert.convert<String>(json['superChapterName']);
	if (superChapterName != null) {
		navigateInfoArticles.superChapterName = superChapterName;
	}
	final List<dynamic>? tags = jsonConvert.convertListNotNull<dynamic>(json['tags']);
	if (tags != null) {
		navigateInfoArticles.tags = tags;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		navigateInfoArticles.title = title;
	}
	final int? type = jsonConvert.convert<int>(json['type']);
	if (type != null) {
		navigateInfoArticles.type = type;
	}
	final int? userId = jsonConvert.convert<int>(json['userId']);
	if (userId != null) {
		navigateInfoArticles.userId = userId;
	}
	final int? visible = jsonConvert.convert<int>(json['visible']);
	if (visible != null) {
		navigateInfoArticles.visible = visible;
	}
	final int? zan = jsonConvert.convert<int>(json['zan']);
	if (zan != null) {
		navigateInfoArticles.zan = zan;
	}
	return navigateInfoArticles;
}

Map<String, dynamic> $NavigateInfoArticlesToJson(NavigateInfoArticles entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['apkLink'] = entity.apkLink;
	data['audit'] = entity.audit;
	data['author'] = entity.author;
	data['canEdit'] = entity.canEdit;
	data['chapterId'] = entity.chapterId;
	data['chapterName'] = entity.chapterName;
	data['collect'] = entity.collect;
	data['courseId'] = entity.courseId;
	data['desc'] = entity.desc;
	data['descMd'] = entity.descMd;
	data['envelopePic'] = entity.envelopePic;
	data['fresh'] = entity.fresh;
	data['host'] = entity.host;
	data['id'] = entity.id;
	data['link'] = entity.link;
	data['niceDate'] = entity.niceDate;
	data['niceShareDate'] = entity.niceShareDate;
	data['origin'] = entity.origin;
	data['prefix'] = entity.prefix;
	data['projectLink'] = entity.projectLink;
	data['publishTime'] = entity.publishTime;
	data['realSuperChapterId'] = entity.realSuperChapterId;
	data['selfVisible'] = entity.selfVisible;
	data['shareDate'] = entity.shareDate;
	data['shareUser'] = entity.shareUser;
	data['superChapterId'] = entity.superChapterId;
	data['superChapterName'] = entity.superChapterName;
	data['tags'] =  entity.tags;
	data['title'] = entity.title;
	data['type'] = entity.type;
	data['userId'] = entity.userId;
	data['visible'] = entity.visible;
	data['zan'] = entity.zan;
	return data;
}