/// @author lll
/// @date on 2022/6/14
class NetApi {
  static const String baseUrl = "http://www.wanandroid.com";

  static const String projectTree = "/project/tree/json";

  static const String banner = "/banner/json";

  static String projectArticle(int page, int category) => "/project/list/$page/json?cid=$category";
}
