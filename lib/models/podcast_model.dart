import 'package:techblog/component/api_constant.dart';

class PodCastModel {
  String? id;
  String? title;
  String? poster;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  PodCastModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.catName,
    required this.author,
    required this.view,
    required this.status,
    required this.createdAt,
  });

  PodCastModel.fromJson(Map<String, dynamic> element) {
     id = element["id"];
     title = element["title"];
     poster =  ApiConstant.hostDlUrl +  element["poster"];
     catName = element["cat_name"];
     author = element["author"];
     view = element["view"];
     status = element["status"];
     createdAt = element["created_at"];
  }
}

            // "id": "127",
            // "title": "تست هستم",
            // "poster": "''",
            // "cat_name": "اخبار و مقالات",
            // "author": "بهرام امینی",
            // "view": "15",
            // "status": "0",
            // "created_at": "۱۴۰۳/۴/۱۳"