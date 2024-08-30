import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/component/my_colors.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/component/my_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
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
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                Assets.icons.bluePen.provider(),
                color: SolidColors.seeMore,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                MyStrings.imageProfileEdit,
                style: textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(
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
          const SizedBox(
            height: 40,
          ),
          TechDivider(size: size),
          InkWell(
            onTap: (() {}),
            splashColor: SolidColors.primeryColor,
            child: SizedBox(
                height: 45,
                child: Center(
                    child: Text(
                  MyStrings.myFavArticleText,
                  style: textTheme.bodySmall,
                ))),
          ),
          TechDivider(size: size),
          InkWell(
            onTap: (() {}),
            splashColor: SolidColors.primeryColor,
            child: SizedBox(
                height: 45,
                child: Center(
                    child: Text(
                  MyStrings.myFavPodCastsText,
                  style: textTheme.bodySmall,
                ))),
          ),
          TechDivider(size: size),
          InkWell(
            onTap: (() {}),
            splashColor: SolidColors.primeryColor,
            child: SizedBox(
                height: 45,
                child: Center(
                    child: Text(
                  MyStrings.logOutText,
                  style: textTheme.bodySmall,
                ))),
          ),
        const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
