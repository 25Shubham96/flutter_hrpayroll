import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hrpayroll/Network/Utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {

  Dio dio = new Dio();
  Util _util;

  void getClient() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    
    dio.options.baseUrl = "http://103.1.92.74:8098/api/";
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;
    dio.options.headers = {
      HttpHeaders.contentTypeHeader : 'application/json',
      HttpHeaders.authorizationHeader : "Basic ${sharedPreferences.get(_util.sessionId)}"
    };
    dio.interceptors.add(LogInterceptor(responseBody: false));
  }

}