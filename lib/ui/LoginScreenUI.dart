// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:arlib_project/bloc/Disease_state.dart';
import 'package:arlib_project/ui/HomePageScreenUI.dart';
import 'package:arlib_project/utils/AppColors.dart';
import 'package:arlib_project/utils/FieldValidator.dart';
import 'package:arlib_project/widgets/TextFormInputField.dart';
import 'package:arlib_project/widgets/Txt.dart';
import 'package:arlib_project/widgets/WidgetButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../bloc/Disease_bloc.dart';
import '../bloc/Disease_event.dart';
import '../widgets/TextFormPasswordField.dart';

class LoginScreenUI extends StatefulWidget {
  const LoginScreenUI({Key? key}) : super(key: key);

  @override
  State<LoginScreenUI> createState() => _LoginScreenUIState();
}

class _LoginScreenUIState extends State<LoginScreenUI> {
  TextEditingController emailController = TextEditingController(text: "anil@gmail.com");
  TextEditingController passwordController = TextEditingController(text: "o1in2woindoe");
  final formKey = GlobalKey<FormState>();
  var userDB;
  var box;

  @override
  initState() {
    super.initState();
    initHive();
  }

  initHive() async {
    box = Hive.box('userDB');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Container(
              height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/background/ic_login_bg.png"), fit: BoxFit.cover)),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: context.height / 7),
                    Txt("Flutter Project", fontSize: 27, fontWeight: FontWeight.w600, color: AppColors.primaryColor),
                    SizedBox(height: context.height / 8),
                    TextFormInputField(
                      hintText: "Email",
                      iconPrefix: Icons.account_circle,
                      controller: emailController,
                      validator: (value) {
                        return FieldValidator.validateEmail(value);
                      },
                    ),
                    SizedBox(height: context.height * 0.02),
                    TextFormPasswordField(
                      hintText: "Enter Password",
                      controller: passwordController,
                      validator: (value) {
                        return FieldValidator.validatePassword(value);
                      },
                    ),
                    SizedBox(height: context.height * 0.2),
                    WidgetButton(
                      text: "Log In",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          saveData();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  saveData() {
    box.put("id", emailController.text);
    box.put("time", DateTime.now());

    Navigator.push(context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => DiseaseBloc(),
          child: HomePageScreenUI(
            username: emailController.text,
          ),
        ),
      ),
    );

    clearData();
  }

  clearData() {
    emailController.clear();
    passwordController.clear();
  }
}
