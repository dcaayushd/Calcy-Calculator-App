import 'package:flutter/material.dart';
import 'package:calcy_calculatorapp/controller/calculate_controller.dart';
import 'package:calcy_calculatorapp/controller/theme_controller.dart';
import 'package:calcy_calculatorapp/utils/colors.dart';
import 'package:calcy_calculatorapp/widget/button.dart';

class InPutSection extends StatelessWidget {
  final ThemeController themeController;
  final CalculateController controller;
  final List<String> buttons;

  InPutSection(this.themeController, this.controller, {super.key})
      : buttons = [
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

  bool isOperator(String y) {
    if (y == "%" || y == "/" || y == "x" || y == "-" || y == "+" || y == "=") {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: themeController.isDark
              ? DarkColors.sheetBgColor
              : LightColors.sheetBgColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: buttons.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return CustomAppButton(
                  buttonTapped: () {
                    controller.clearInputAndOutput();
                  },
                  color: themeController.isDark
                      ? DarkColors.leftOperatorColor
                      : LightColors.leftOperatorColor,
                  textColor: themeController.isDark
                      ? DarkColors.btnBgColor
                      : LightColors.btnBgColor,
                  text: buttons[index],
                );
              case 1:
                return CustomAppButton(
                  buttonTapped: () {
                    controller.deleteBtnAction();
                  },
                  color: themeController.isDark
                      ? DarkColors.leftOperatorColor
                      : LightColors.leftOperatorColor,
                  textColor: themeController.isDark
                      ? DarkColors.btnBgColor
                      : LightColors.btnBgColor,
                  text: buttons[index],
                );
              case 19:
                return CustomAppButton(
                  buttonTapped: () {
                    controller.equalPressed();
                  },
                  color: themeController.isDark
                      ? DarkColors.leftOperatorColor
                      : LightColors.leftOperatorColor,
                  textColor: themeController.isDark
                      ? DarkColors.btnBgColor
                      : LightColors.btnBgColor,
                  text: buttons[index],
                );
              default:
                return CustomAppButton(
                  buttonTapped: () {
                    controller.onBtnTapped(buttons, index);
                  },
                  color: isOperator(buttons[index])
                      ? LightColors.operatorColor
                      : themeController.isDark
                          ? DarkColors.btnBgColor
                          : LightColors.btnBgColor,
                  textColor: isOperator(buttons[index])
                      ? Colors.white
                      : themeController.isDark
                          ? Colors.white
                          : Colors.black,
                  text: buttons[index],
                );
            }
          },
        ),
      ),
    );
  }
}