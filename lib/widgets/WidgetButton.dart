// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/AppColors.dart';

class WidgetButton extends StatelessWidget {
  WidgetButton({
    required this.onPressed,
    required this.text,
  });

  final GestureTapCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context,) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 44,
        width: Get.width / 2.5,
        decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Center(
          child: Text(text,
            style: TextStyle(fontSize: 20, color: AppColors.bgColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
