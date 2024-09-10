import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/component/my_colors.dart';
import 'package:techblog/view/splash_screen.dart';


void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('fa'),
      theme: ThemeData(
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
            bodySmall: TextStyle(
                fontFamily: 'dana',
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 0, 0, 0)),
            bodyMedium: TextStyle(
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
          )),
      home: const SplashScreen()
      // home: MainScreen()
      // home: ArticleListScreen(title: 'مقالات جدید',)
      // home: Single(),
    );
  }
}
