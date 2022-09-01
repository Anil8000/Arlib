// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables

import 'package:arlib_project/main.dart';
import 'package:arlib_project/utils/AppColors.dart';
import 'package:arlib_project/utils/AppCommonFunction.dart';
import 'package:arlib_project/widgets/Txt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import '../bloc/Disease_bloc.dart';
import '../bloc/Disease_event.dart';
import '../bloc/Disease_state.dart';
import '../model/DiseaseResponse.dart';

class HomePageScreenUI extends StatefulWidget {
  String username;

  HomePageScreenUI({Key? key, required this.username}) : super(key: key);

  @override
  State<HomePageScreenUI> createState() => _HomePageScreenUIState();
}

class _HomePageScreenUIState extends State<HomePageScreenUI> {
  var box;

  @override
  initState() {
    super.initState();
    initHive();
    BlocProvider.of<DiseaseBloc>(context).add(DiseaseRequest());
  }

  initHive() async {
    box = Hive.box('userDB');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text("Home Page"), backgroundColor: AppColors.primaryColor, elevation: 0),
      body: BlocConsumer<DiseaseBloc, DiseaseState>(
        listener: (context, state) {
          if (state is DiseaseLoadFailure) {
            AppCommonFunction.flutterToast(state.error.toString(), false);
          } else if (state is DiseaseLoadSuccess) {
            //print("className.length  ::  ${state.classKey.length.toString()}");
          }
        },
        builder: (context, state) {
          if (state is DiseaseInProgress)
            return AppCommonFunction.circularIndicator();
          else if (state is DiseaseLoadSuccess)
            return state.associatedKey!.isEmpty
                ? AppCommonFunction.noDataFound()
                : Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: Get.width,
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Txt("Welcome, ${box.get("id")}", fontSize: 20),
                              Txt(" ${DateFormat('dd-MM-yy hh:mm a').format(box.get("time"))}", fontSize: 18),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.associatedKey!.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                width: Get.width,
                                padding: EdgeInsets.all(8.0),
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Txt("Name:  ${state.data2![state.associatedKey![index]][0]['name']}",
                                            maxLines: 5),
                                        Txt("Dose: ${state.data2![state.associatedKey![index]][0]['dose']}"),
                                        Txt("Strength: ${state.data2![state.associatedKey![index]][0]['strength']}"),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
          else
            return AppCommonFunction.circularIndicator();
        },
      ),
    ));
  }
}


//https://pastebin.com/jKVv22p8
//http://mocky.io/