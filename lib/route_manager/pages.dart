import 'package:get/get.dart';
import 'package:techblog/route_manager/binding.dart';
import 'package:techblog/route_manager/names.dart';
import 'package:techblog/view/articles/manage_article.dart';
import 'package:techblog/view/articles/single.dart';
import 'package:techblog/view/articles/single_manage_article.dart';
import 'package:techblog/view/main_screen/main_screen.dart';
import 'package:techblog/view/podcast/single_podcast.dart';
import 'package:techblog/view/splash_screen.dart';

class Pages {
  Pages._();
 static List<GetPage<dynamic>> pages = [
          GetPage(
              name: NamedRoute.initialRoute,
              page: () => const SplashScreen(),
              ),
          GetPage(
              name: NamedRoute.routeMainScreen,
              page: () => MainScreen(),
              binding: RegisterBinging()),
          GetPage(
              name: NamedRoute.routeSingleArticle,
              page: () => Single(),
              binding: ArticleBinding()),
          GetPage(
              name: NamedRoute.manageArticle,
              page: () => ManageArticle(),
              binding: ArticleManagerBinding()),
          GetPage(
              name: NamedRoute.singleManageArticle,
              page: () => SingleManageArticle(),
              binding: ArticleManagerBinding()),
          GetPage(
              name: NamedRoute.singlePodcast,
              page: () => SinglePodcast(),
          ),
        ];


}