import 'package:flutter/material.dart';
import 'package:calcy_calculatorapp/bindings/my_bindings.dart';
import 'package:calcy_calculatorapp/screen/main_screen.dart';
import 'package:get/get.dart';


//
//! Instagram
//! @dcaayushd
//
//? GitHub
//? dcaayushd
//

//

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MyBindings(),
      title: "Flutter Calculator",
      home: MainScreen(),
    );
  }
}
