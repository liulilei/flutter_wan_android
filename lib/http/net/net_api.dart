/// @author lll
/// @date on 2022/6/14
class NetApi {
  static const String baseUrl = "https://www.wanandroid.com";

  static const String projectTree = "/project/tree/json";

  static const String banner = "/banner/json";

  static String projectArticle(int page, int category) => "/project/list/$page/json?cid=$category";

  static const String tree = "/tree/json";

  static const String navi = "/navi/json";

  static String articleArticle(int page, int category) => "/article/list/$page/json?cid=$category";
}
