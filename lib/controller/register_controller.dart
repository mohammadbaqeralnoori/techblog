import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/constant/api_constant.dart';
import 'package:techblog/constant/storage_const.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/main.dart';
import 'package:techblog/services/dio_service.dart';
import 'package:techblog/view/main_screen/main_screen.dart';
import 'package:techblog/view/register/register_intro.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activedCodeTextEditingController =
      TextEditingController();
  var email = "";
  var userId = "";

  register() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'command': 'register'
    };

    var response = await DioService().postMethod(map, ApiUrlConstant.postRegister);
    // debugPrint(response);
    email = emailTextEditingController.text;
    userId = response.data['user_id'];
    debugPrint(response.toString());
  }

  verify() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'user_id': userId,
      'code': activedCodeTextEditingController.text,
      'command': 'verify'
    };
   
    debugPrint(map.toString());
    var response = await DioService().postMethod(map, ApiUrlConstant.postRegister);
    debugPrint(response.data.toString());

    var status = response.data['response'];
    switch (status) {
      case 'verified':
        var box = GetStorage();
        
       var token =  box.write(StorageKey.token, response.data['token']);
       debugPrint(token.toString());

        box.write(StorageKey.userId, response.data['user_id']);

        // ignore: prefer_interpolation_to_compose_strings
        debugPrint("read::: " + box.read(StorageKey.token));

        // ignore: prefer_interpolation_to_compose_strings
        debugPrint("read::: " + box.read(StorageKey.userId));

        Get.offAll(MainScreen());
        break;
      case 'incorrect_code':
        Get.snackbar('خطا', 'کد فعال سازی غلط است');
        break;
      case 'expired':
        Get.snackbar('خطا', 'کد فعال سازی منقظی شده است');
        break;
    }
  }

  toggleLogin() {
    if (GetStorage().read(StorageKey.token) == null) {
      Get.to(RegisterIntro());
    } else {
      routeToWriteBottonSheet();
    }
  }

  routeToWriteBottonSheet() {
    Get.bottomSheet(Container(
      height: Get.height / 3,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Row(
            children: [
              Image(
                image: Assets.icons.techBotPng.provider(),
                height: 40,
              ),
              const SizedBox(
                width: 8,
              ),
              const Text("دونسته هات رو با بقیه به اشتراک بذار ...")
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
              """ فکر کن !!  اینجا بودنت به این معناست که یک گیک تکنولوژی هستی
دونسته هات رو با  جامعه‌ی گیک های فارسی زبان به اشتراک بذار..
"""),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  // debugPrint("wrti Article");
                  Get.toNamed(NamedRoute.manageArticle);
                },
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Image(
                        image: Assets.icons.pencilOnBook.provider(),
                        height: 32,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text("مدیریت مقاله ها")
                    ],
                  ),
                ),
              ),
              GestureDetector(
                 onTap: () {
                  debugPrint("wrti Padcast");
                  
                },
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Image(
                        image: Assets.icons.voice.provider(),
                        height: 32,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text("مدیریت پادکست ها")
                    ],
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    ));
  }
}
