import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/my_colors.dart';
import 'package:techblog/my_component.dart';
import 'package:techblog/my_strings.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: Assets.icons.profileIcon.provider(),
            height: 100,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                Assets.icons.bluePen.provider(),
                color: solidColors.seeMore,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                myStrings.imageProfileEdit,
                style: textTheme.bodyMedium,
              ),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            "فاطمه امیری",
            style: textTheme.headlineLarge,
          ),
          Text(
            "fatemeamiri@gmail.com",
            style: textTheme.bodySmall,
          ),
          SizedBox(
            height: 40,
          ),
          techDivider(size: size),
          InkWell(
            onTap: (() {}),
            splashColor: solidColors.primeryColor,
            child: SizedBox(
                height: 45,
                child: Center(
                    child: Text(
                  myStrings.myFavArticleText,
                  style: textTheme.bodySmall,
                ))),
          ),
          techDivider(size: size),
          InkWell(
            onTap: (() {}),
            splashColor: solidColors.primeryColor,
            child: SizedBox(
                height: 45,
                child: Center(
                    child: Text(
                  myStrings.myFavPodCastsText,
                  style: textTheme.bodySmall,
                ))),
          ),
          techDivider(size: size),
          InkWell(
            onTap: (() {}),
            splashColor: solidColors.primeryColor,
            child: SizedBox(
                height: 45,
                child: Center(
                    child: Text(
                  myStrings.logOutText,
                  style: textTheme.bodySmall,
                ))),
          ),
        SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
