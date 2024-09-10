import 'package:techblog/component/api_constant.dart';

class ArticleModel {
  String? id;
  String? title;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  // String? isFavorite;
  String? createdAt;

  ArticleModel({
    required this.id,
    required this.title,
    required this.image,
    required this.catId,
    required this.catName,
    required this.author,
    required this.view,
    required this.status,
    // this.isFavorite,
    required this.createdAt,
  });

  ArticleModel.fromJson(Map<String, dynamic> element) {
     id = element["id"];
     title = element["title"];
     image = ApiConstant.hostDlUrl + element["image"];
     catId = element["cat_id"];
     catName = element["cat_name"];
     author = element["author"];
     view = element["view"];
     status = element["status"];
    //  status = element["isFavorite"];
     createdAt = element["created_at"];
  }
}

            // "id": "1",
            // "title": "۵ بازی مشابه Assassin’s Creed Valhalla که باید بازی کنید",
            // "image": "/Techblog/assets/upload/images/article/valhalla.jpg",
            // "cat_id": "1",
            // "cat_name": "اخبار و مقالات",
            // "author": "بهرام امینی",
            // "view": "5529",
            // "status": "1",
            // "created_at": "۱۴۰۱/۲/۱۶"