import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/my_colors.dart';
import 'package:techblog/view/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: solidColors.scafoldBg,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              Image(
                image: Assets.images.tecSplash.provider(),
                height: size.height / 13.6,
              ),
              const Icon(
                Icons.search,
                color: Colors.black,
              )
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Stack(
              children: [
                homeScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: size.height / 10,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: gradiantColors.bottomNavBg,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: Padding(
                      padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin, bottom: 5),
                      child: Container(
                        height: size.height / 8,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                            gradient:
                                LinearGradient(colors: gradiantColors.bottomNav)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon:
                                  ImageIcon(Assets.icons.homeNavIcon.provider()),
                              color: Colors.white,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon:
                                  ImageIcon(Assets.icons.writeNavIcon.provider()),
                              color: Colors.white,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: ImageIcon(
                                  Assets.icons.profileNavIcon.provider()),
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
