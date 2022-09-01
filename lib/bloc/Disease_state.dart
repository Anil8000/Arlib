
import 'package:arlib_project/model/DiseaseResponse.dart';
import 'package:flutter/material.dart';

@immutable
abstract class DiseaseState {}

class DiseaseInitial extends DiseaseState {}

class DiseaseInProgress extends DiseaseState {}

class DiseaseLoadSuccess extends DiseaseState {
  late DiseaseResponse? diseaseResponse;
  List<String>? associatedKey = [];
  Map? data2;

  DiseaseLoadSuccess({ this.diseaseResponse,this.data2, this.associatedKey});
}

class DiseaseLoadFailure extends DiseaseState {
  final String error;
  DiseaseLoadFailure({required this.error});
}