import 'package:techblog/constant/api_constant.dart';

class PosterModel {
  String? id;
  String? title;
  String? image;

  PosterModel({
    this.id,
    this.title,
    this.image,
  });

  PosterModel.fromJson(Map<String, dynamic> element) {
     id = element["id"];
     title = element["title"];
     image = ApiUrlConstant.hostDlUrl + element["image"];

  }
}


        // "id": "16",
        // "title": "اطلاعات جدیدی از بازی Assassin's Creed Mirage فاش شد",
        // "image": "/Techblog/assets/upload/images/article/20220904181457.jpg"