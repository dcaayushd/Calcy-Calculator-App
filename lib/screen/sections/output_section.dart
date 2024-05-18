import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:calcy_calculatorapp/controller/calculate_controller.dart';
import 'package:calcy_calculatorapp/controller/theme_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OutPutSection extends StatelessWidget {
  final ThemeController themeController;
  final CalculateController controller;

  const OutPutSection(this.themeController, this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: GetBuilder<ThemeController>(builder: (controller) {
              return AdvancedSwitch(
                controller: controller.switcherController,
                activeImage: const AssetImage('assets/images/day_sky.png'),
                inactiveImage: const AssetImage('assets/images/night_sky.jpg'),
                activeColor: Colors.green,
                inactiveColor: Colors.grey,
                activeChild: Text(
                  'Day',
                  style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                inactiveChild: Text(
                  'Night',
                  style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(1000)),
                width: 100.0,
                height: 45.0,
                enabled: true,
                disabledOpacity: 0.5,
              );
            }),
          ),

          // Main Result - user input and output
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 70),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    controller.userInput,
                    style: GoogleFonts.ubuntu(
                      color: themeController.isDark
                          ? Colors.white
                          : Colors.black,
                      fontSize: 38,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    controller.userOutput,
                    style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.bold,
                      color: themeController.isDark
                          ? Colors.white
                          : Colors.black,
                      fontSize: 60,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}