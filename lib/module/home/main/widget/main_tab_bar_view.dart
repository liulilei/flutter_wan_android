import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_flutter/app/typedef/function.dart';
import 'package:test_flutter/entity/article_info.dart';
import 'package:test_flutter/utils/image_utils.dart';

/// @author lll
/// @date on 2022/6/15
class MainTabBarViewPage extends StatelessWidget {
  const MainTabBarViewPage({Key? key, required this.articleInfo, required this.itemClick}) : super(key: key);

  final ArticleInfo? articleInfo;

  final ParamVoidCallback itemClick;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return _buildArticleCard(articleInfo?.datas![index]);
      },
      separatorBuilder: (_, i) => const Divider(height: 0, color: Colors.transparent),
      itemCount: (articleInfo?.datas ?? []).length,
    );
  }

  Widget _buildArticleCard(ArticleInfoDatas? articleInfo) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Card(
        elevation: 2.w,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
        ),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
          onTap: () => itemClick(),
          child: Container(
            height: 170.w,
            padding: EdgeInsets.all(10.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 90.w, height: 150.w, child: ImageUtils.loadNormalImg(articleInfo?.envelopePic ?? "")),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          articleInfo?.title ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 15.sp, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          articleInfo?.desc ?? "",
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        Text(
                          "${articleInfo?.niceDate ?? ""} ${articleInfo?.author ?? ""}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
