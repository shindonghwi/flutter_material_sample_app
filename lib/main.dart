import 'package:flutter/material.dart';
import 'package:flutter_material_sample_app/feature/presentation/page/button/basic/button_basic.dart';
import 'package:flutter_material_sample_app/feature/presentation/page/home/home_page.dart';
import 'package:flutter_material_sample_app/feature/presentation/page/image/load_image/load_image.dart';
import 'package:flutter_material_sample_app/feature/presentation/page/image/slider_image/slider_image.dart';

import 'feature/presentation/page/bottom_navigation/basic/bottom_navigation_basic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: true,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),

        /// Bottom Navigation
        '/Bottom Navigation/Basic': (context) => BottomNavigationBasic(),

        /// Button
        '/Buttons/Basic': (context) => ButtonBasic(),

        /// image
        '/Image/Load Image': (context) => Img(),
        '/Image/Slider Image': (context) => SliderImg(),
      },
    );
  }
}