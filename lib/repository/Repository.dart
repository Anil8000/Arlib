
import 'package:arlib_project/repository/ApiProvider.dart';

import '../model/DiseaseResponse.dart';

class Repository {
  ApiProvider apiProvider = ApiProvider();

  Future<DiseaseResponse?> getDiseaseData() async {
    return await apiProvider.getDiseaseApi();
  }

}