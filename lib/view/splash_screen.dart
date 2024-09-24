import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/constant/my_colors.dart';

import 'package:techblog/route_manager/names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {


    Future.delayed(const Duration(seconds: 3)).then((value) {
     Get.offAllNamed(NamedRoute.routeMainScreen);
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: Assets.images.tecSplash.provider(),
                  height: 64,
                ),
                const SizedBox(height: 32,),
                const SpinKitFadingCube(
                  color: SolidColors.primeryColor,
                  size: 32.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
