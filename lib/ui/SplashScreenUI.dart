// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../bloc/Disease_bloc.dart';
import '../utils/AppColors.dart';
import '../utils/AppCommonFunction.dart';
import '../utils/AppString.dart';
import 'LoginScreenUI.dart';

class SplashScreenUI extends StatefulWidget {
  @override
  _SplashScreenUIState createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      //Get.offAll(LoginScreenUI());
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider(create: (context) => DiseaseBloc(), child: LoginScreenUI())),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: AppCommonFunction.splashBackground(),
        child: Center(
          child: Text(
            AppString.APP_NAME,
            style: TextStyle(fontSize: 34.0, color: AppColors.bgColor, fontWeight: FontWeight.w600),
          ),
        ),
      )),
    );
  }
}
