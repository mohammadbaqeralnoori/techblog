

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/binding.dart';
import 'package:techblog/constant/my_colors.dart';
import 'package:techblog/my_http_overrides.dart';
import 'package:techblog/view/articles/manage_article.dart';
import 'package:techblog/view/articles/single.dart';
import 'package:techblog/view/articles/single_manage_article.dart';
import 'package:techblog/view/main_screen/main_screen.dart';
import 'package:techblog/view/podcast/single_podcast.dart';
import 'package:techblog/view/splash_screen.dart';


void main() async {
  HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: SolidColors.statusBarColor,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: SolidColors.systemNavigationBarColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  await GetStorage.init();
  runApp(const MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale('fa'),
        getPages: [
          GetPage(
              name: NamedRoute.routeMainScreen,
              page: () => MainScreen(),
              binding: RegisterBinging()),
          GetPage(
              name: NamedRoute.routeSingleArticle,
              page: () => Single(),
              binding: ArticleBinding()),
          GetPage(
              name: NamedRoute.manageArticle,
              page: () => ManageArticle(),
              binding: ArticleManagerBinding()),
          GetPage(
              name: NamedRoute.singleManageArticle,
              page: () => SingleManageArticle(),
              binding: ArticleManagerBinding()),
          GetPage(
              name: NamedRoute.singlePodcast,
              page: () => SinglePodcast(),
          ),
        ],
        theme: lightTheme(textTheme),
        // home:  HtmlEditorExample(title: 'content',),
        home: const SplashScreen(),
        // home: SinglePodcast(),
        // home: MainScreen()
        // home: ArticleListScreen(title: 'مقالات جدید',)
        // home: Single(),
        );
  }

  ThemeData lightTheme(TextTheme textTheme) {
    return ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(width: 2))),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                return textTheme.displaySmall;
              }
              return textTheme.titleSmall;
            }),
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                return SolidColors.seeMore;
              }
              return SolidColors.primeryColor;
            }),
          ),
        ),
        fontFamily: 'dana',
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
              fontFamily: 'dana',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: SolidColors.posterTitle),
          headlineMedium: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.white),
          headlineLarge: TextStyle(
              fontFamily: 'dana',
              fontSize: 17,
              fontWeight: FontWeight.w300,
              color: Color.fromARGB(255, 66, 4, 87)),
          titleSmall: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: SolidColors.posterSubTitle),
          bodySmall: TextStyle(                 //headline 4
              fontFamily: 'dana',
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 0, 0, 0)),
          bodyMedium: TextStyle(   // headline 3
              fontFamily: 'dana',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: SolidColors.colorTitle),
          bodyLarge: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 70, 70, 70)),
          labelSmall: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: SolidColors.hintText),
          labelMedium: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: SolidColors.metaTextTitle),
          labelLarge: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: SolidColors.captionColor),
        ));
  }
}



class NamedRoute {

  NamedRoute._();
static String routeMainScreen = "/MainScreen";
static String routeSingleArticle = "/SingleArticle";
static String manageArticle = "/ManageArticle";
static String singleManageArticle = "/SingleManageArticle";
static String singlePodcast = "/SinglePodcast";
  
}
