// ignore_for_file: prefer_const_constructors, prefer_if_null_operators, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/AppColors.dart';
import '../utils/AppString.dart';

// ignore: must_be_immutable
class TextFormPasswordField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final IconData? iconSuffix;
  bool? isObscure = true;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  double borderRadius;

  TextFormPasswordField({
    this.hintText,
    this.controller,
    this.iconSuffix,
    this.borderRadius = 50,
    this.validator,
    this.onSaved,
    this.onChanged,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
        padding: EdgeInsets.all(4.0),
        child: StatefulBuilder(
          builder: (BuildContext context, void Function(void Function()) setState) {
            return TextFormField(
              cursorColor: AppColors.primaryColor,
              style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
              validator: validator == null ? null : validator,
              onSaved: onSaved == null ? null : onSaved,
              onChanged: onChanged == null ? null : onChanged,
              controller: controller == null ? null : controller,
              obscureText: isObscure!,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 8.0),
                  hintStyle: TextStyle(color: AppColors.primaryColor),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.lock_open_outlined,
                    color: AppColors.primaryColor,
                  ),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscure = !isObscure!;
                        });
                      },
                      child: Icon(
                        isObscure! ? Icons.visibility : Icons.visibility_off,
                        color: AppColors.primaryColor,
                      ))),
            );
          },
        ));
  }
}
