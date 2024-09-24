
import 'package:get/get.dart';
import 'package:techblog/controller/articles/list_article_controller.dart';
import 'package:techblog/controller/articles/manage_article_controller.dart';
import 'package:techblog/controller/register_controller.dart';
import 'package:techblog/controller/articles/single_article_controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
  Get.put(ListArticleController());

  Get.lazyPut(() => SingleArticleController());


  }

}
class ArticleManagerBinding implements Bindings {
  @override
  void dependencies() {
  // Get.put(ManageArticleController());
  Get.lazyPut(() => ManageArticleController());

  }

}


class RegisterBinging implements Bindings {
  @override
  void dependencies() {
  Get.put(RegisterController());
  
  }

}