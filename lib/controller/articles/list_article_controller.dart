import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:techblog/constant/api_constant.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/services/dio_service.dart';

class ListArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getList();
  }

  getList() async {
    loading.value = true;
    // ignore: todo
    //TODO get userid from getStorage ApiConstant.getArticleList+userid
    var response = await DioService().getMethod(ApiUrlConstant.getArticleList);

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      loading.value = false;
    }
  }

  getArticleListWithTagsId(String id) async {
    articleList.clear();
    loading.value = true;
    // ignore: todo
    //TODO get userid from getStorage ApiConstant.getArticleList+userid

    final queryParam = {
      'command': 'get_articles_with_tag_id',
      'tag_id': id,
      'user_id': '',
    };

    final uri = Uri.https(ApiUrlConstant.baseUrl, 'article/get.php?', queryParam);

    var response = await DioService().getMethod(uri.toString());

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      loading.value = false;
    }
  }
}
