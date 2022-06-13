import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:test_futter/generated/json/base/json_convert_content.dart';
part '../../generated/json/test_info.g.dart';

@JsonSerializable()
class TestInfo {

	String? asdf;
  
  TestInfo();

  factory TestInfo.fromJson(Map<String, dynamic> json) => _$TestInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TestInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}