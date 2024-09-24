import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/controller/register_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/constant/my_strings.dart';
import 'package:validators/validators.dart';

// ignore: must_be_immutable
class RegisterIntro extends StatelessWidget {
  RegisterIntro({super.key});

  // RegisterController registerController = Get.put(RegisterController());
  var registerController = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: Assets.icons.techBotPng.provider(),
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: MyStrings.wellcome, style: textTheme.bodySmall)),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 32),
                child: ElevatedButton(
                    onPressed: () {
                      _showEamilBottomSheet(context, size, textTheme);
                    },
                    child: Text("بزن بریم", style: textTheme.headlineSmall)))
          ],
        ),
      ),
    ));
  }

  Future<dynamic> _showEamilBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    // RegExp isEmail = RegExp('^[a-z-0-9]+@');
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: ((context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.insertYourEmail,
                    style: textTheme.bodySmall,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      controller: registerController.emailTextEditingController,
                      onChanged: (value) {
                        // print(value + " is Email = " + isEmail.hasMatch(value).toString());
                        isEmail(value);
                        // print(value + " is Email : "+ isEmail(value).toString());
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: "techblog@gmail.com",
                          hintStyle: textTheme.labelSmall),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        registerController.register();
                        Navigator.pop(context);
                        _activateCodeBottomSheet(context, size, textTheme);
                      },
                      child: const Text("ادامه"))
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Future<dynamic> _activateCodeBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    // RegExp isEmail = RegExp('^[a-z-0-9]+@');
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: ((context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.activateCode,
                    style: textTheme.bodySmall,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      controller:
                          registerController.activedCodeTextEditingController,
                      onChanged: (value) {
                        // print(value + " is Email = " + isEmail.hasMatch(value).toString());
                        isEmail(value);
                        // print(value + " is Email : "+ isEmail(value).toString());
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: "******", hintStyle: textTheme.labelSmall),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        registerController.verify();
                      },
                      child: const Text("ادامه"))
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
