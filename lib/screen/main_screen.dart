import 'package:flutter/material.dart';
import 'package:calcy_calculatorapp/controller/calculate_controller.dart';
import 'package:calcy_calculatorapp/controller/theme_controller.dart';
import 'package:calcy_calculatorapp/utils/colors.dart';
import 'package:get/get.dart';

import 'sections/input_section.dart';
import 'sections/output_section.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<String> buttons = [
    "C",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "x",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "ANS",
    "=",
  ];

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CalculateController>();
    var themeController = Get.find<ThemeController>();

    return GetBuilder<ThemeController>(builder: (context) {
      return Scaffold(
        backgroundColor: themeController.isDark
            ? DarkColors.scaffoldBgColor
            : LightColors.scaffoldBgColor,
        body: Column(
          children: [
            GetBuilder<CalculateController>(builder: (context) {
              return OutPutSection(themeController, controller);
            }),
            InPutSection(themeController, controller),
          ],
        ),
      );
    });
  }
}


