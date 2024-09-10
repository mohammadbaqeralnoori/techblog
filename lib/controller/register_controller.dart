

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/component/api_constant.dart';
import 'package:techblog/component/storage_const.dart';
import 'package:techblog/services/dio_service.dart';

class RegisterController extends GetxController {


  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activedCodeTextEditingController = TextEditingController();
  var email = "";
  var userId = "";

 register() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'command': 'register'
    };

    var response =
        await DioService().postMethod(map, ApiConstant.postRegister);
    print(response);
    email = emailTextEditingController.text;
    userId = response.data['user_id'];
    debugPrint(response.toString());
  }


   verify() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'command': 'register'
    };

    var response =
        await DioService().postMethod(map, ApiConstant.postRegister);
    print(response.data);
    if (response.data['response'] == 'verified') {
    var box = GetStorage();
    box.write(token, response.data['token']);
    box.write(userId, response.data['userId']);

    // print("read::: " + bool.read(token));
    // print("read::: " + bool.read(userId));
      
    } 
    // else {
    //   lo
    // }

    // email = emailTextEditingController.text;
    // userId = response.data['user_id'];
    // debugPrint(response.toString());
  }


}