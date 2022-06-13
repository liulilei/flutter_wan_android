part of '../../entity/test/test_info.dart';


TestInfo _$TestInfoFromJson(Map<String, dynamic> json) {
	final TestInfo testInfo = TestInfo();
	final String? asdf = jsonConvert.convert<String>(json['asdf']);
	if (asdf != null) {
		testInfo.asdf = asdf;
	}
	return testInfo;
}

Map<String, dynamic> _$TestInfoToJson(TestInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['asdf'] = entity.asdf;
	return data;
}