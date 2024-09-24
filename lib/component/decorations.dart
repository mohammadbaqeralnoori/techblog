
import 'package:flutter/material.dart';
import 'package:techblog/constant/my_colors.dart';

class Decorations {
  Decorations._();
  static BoxDecoration mainGradiant = const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                gradient: LinearGradient(colors: GradiantColors.bottomNav));
}