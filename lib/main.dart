// ignore_for_file: prefer_const_constructors

import 'package:arlib_project/ui/SplashScreenUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'bloc/Disease_bloc.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('userDB');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SplashScreenUI()),
    );
  }
}
