// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:nutrition_app/login/login.dart';
import 'package:nutrition_app/makanan/DetailFood.dart';
import 'package:nutrition_app/makanan/FoodList.dart';
import 'package:nutrition_app/makanan/TambahFood.dart';
import 'package:nutrition_app/minuman/MinumanList.dart';
import 'package:nutrition_app/splashscreen.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Nutrisi Apps | Kelompok 2',
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}
