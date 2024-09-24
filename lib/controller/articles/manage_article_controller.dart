import 'dart:math';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/constant/api_constant.dart';
import 'package:techblog/constant/commands.dart';
import 'package:techblog/constant/storage_const.dart';
import 'package:techblog/controller/file_controller.dart';
import 'package:techblog/models/article_info_model.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/models/tags_model.dart';

import '../../services/dio_service.dart';

class ManageArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList.empty();
  // ignore: non_constant_identifier_names
  RxBool Loading = false.obs;
  RxList<TagsModel> tagList = RxList.empty();
  RxBool loading = false.obs;
  TextEditingController titleTextEditingController = TextEditingController();
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel(
    'اینجا عنوان مقاله قرار میگیره ، یه عنوان جذاب انتخاب کن',
    """من متن و بدنه اصلی مقاله هستم ، اگه میخوای من رو ویرایش کنی و یه مقاله جذاب بنویسی ، نوشته آبی رنگ بالا که نوشته "ویرایش متن اصلی مقاله" رو با انگشتت لمس کن تا وارد ویرایشگر بشی""",
    ""
  ).obs;
  

  @override
  void onInit() {
    super.onInit();
    getManagedArticle();
  }

  getManagedArticle() async {
    Loading.value = true;
    // var response = await DioService().getMethod(ApiConstant.publishedByMe + GetStorage().read(StorageKey.userId));
    var response =
        await DioService().getMethod("${ApiUrlConstant.publishedByMe}1");
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      Loading.value = false;
    }
  }


 updateTitle () {
  articleInfoModel.update((val) {
    val!.title = titleTextEditingController.text;
  });
 }



 storeArticle () async{
  var fileController = Get.find<FilePickerController>();

  loading.value = true;

Map <String, dynamic> map = {
    ApiArticleKeyConstant.title : articleInfoModel.value.title!,
    ApiArticleKeyConstant.content : articleInfoModel.value.content!,
    ApiArticleKeyConstant.catId : articleInfoModel.value.catId!,
    ApiArticleKeyConstant.userId : GetStorage().read(StorageKey.userId),
    ApiArticleKeyConstant.image : await dio.MultipartFile.fromFile(fileController.file.value.path!),
    ApiArticleKeyConstant.command : Commands.store,
    ApiArticleKeyConstant.tagList : "[]",



};
  var response =  await DioService().postMethod(map, ApiUrlConstant.articlePost);
  log(response.data);
  loading.value = false;
 }

}
