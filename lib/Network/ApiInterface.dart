import 'dart:async';

import './ApiClient.dart';
import '../response_model/ActionResponse.dart';
import '../request_model/ActionRequest.dart';

class ApiInterface {
  
  ApiClient apiClient = ApiClient();
  
  Future<ActionResponse> LeaveSanctionResponseData(ActionRequest actionRequest) async{
    apiClient.getClient();
    var response = await apiClient.dio.post(
      "employeesapi/leavesanction",
      data: actionReqToJson(actionRequest),
    );
    return actionResFromJson(response.data);
  }
}