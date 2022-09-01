// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/Txt.dart';
import 'AppColors.dart';
import 'AppString.dart';
import 'package:get/get.dart';

class AppCommonFunction {
  static flutterToast(String? msg, bool isSuccess) {
    Fluttertoast.showToast(
        msg: msg.toString(),
        fontSize: 14.0,
        backgroundColor: isSuccess ? AppColors.primaryColor : Colors.redAccent,
        textColor: AppColors.white,
        toastLength: Toast.LENGTH_SHORT);
  }

  static BoxDecoration splashBackground() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage("${AppString.imagesBackgroundPath}ic_splash_bg.png"),
        fit: BoxFit.cover,
      ),
    );
  }

  static circularIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  static noDataFound({String text = "No Data Found!"}) {
    return Center(
      child: Txt(text, color: AppColors.primaryColor, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
