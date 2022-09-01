
// ignore_for_file: avoid_print

import 'package:arlib_project/repository/Repository.dart';
import 'package:bloc/bloc.dart';

import '../model/DiseaseResponse.dart';
import 'Disease_event.dart';
import 'Disease_state.dart';


class DiseaseBloc extends Bloc<DiseaseEvent, DiseaseState> {
  final repository = Repository();
  DiseaseBloc() : super(DiseaseInitial() );


  @override
  Stream<DiseaseState> mapEventToState(DiseaseEvent event) async* {
    yield DiseaseInProgress();
    try {
      DiseaseResponse? diseaseResponse = await repository.getDiseaseData();
      List<String> associatedKey = [];
      Map? dataa;
      Map? dataa2;

      for(int i=0; i<diseaseResponse!.problems!.length; i++){
        for(int j=0; j<diseaseResponse.problems![i].diabetes!.length; j++){
          for(int k=0; k<diseaseResponse.problems![i].diabetes![j].medications!.length; k++){
            dataa = diseaseResponse.problems![i].diabetes![j].medications![k].medicationsClasses![0].toJson();
            print("dataa  :: ${dataa}");
            dataa.forEach((key, value) {
              dataa2 = value[0];
              dataa2!.forEach((key2, value2) {
                associatedKey.add(key2);
              });
            });
          }
        }
      }

      print("associatedKey  :: ${associatedKey.length}");
      yield DiseaseLoadSuccess(diseaseResponse: diseaseResponse, data2: dataa2,associatedKey: associatedKey);


    } catch (e) {
      print(e);
      yield DiseaseLoadFailure(error: "Something went wrong");
    }
  }

}
