
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_clean_architecture/utils/print_value.dart';
import 'package:http_clean_architecture/utils/toast_message.dart';

class HttpHelper{
  Future<dynamic> get({required String url , bool isRequiredAuthorization = false})async{
    Map<String , String> apiHeaders = {"Content type" : "application/json"};

    if(isRequiredAuthorization){
      apiHeaders ={
        "content-type" : "application/json",
        "Authorization" : "Bearer 'userBearerToken'"
      };
    }
    try{
      final apiResponse = await http.get(Uri.parse(url) , headers : apiHeaders);
      printValue(url , tag: "API GET URL : ");
      printValue(apiHeaders, tag: "API Header");
      printValue(apiResponse.body , tag: "API Response");
      return _returnResponse(response : apiResponse);

    }on SocketException{
      return null;
    }
  }


  dynamic _returnResponse({required http.Response response}){
    switch (response.statusCode){
      case 200:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 400:
        var decodeError = json.decode(response.body);
        if(decodeError.containsKey("message")){
          toastMessage(decodeError["message"].toString());
        }
        throw Exception("API error with status code 400");
      case 401:
        throw Exception("Unauthorized 401");
      case 500:
        throw Exception("API error with status code 500");
      default :
        throw Exception("Error occured with communication with server with status code ${response.statusCode.toString()}");
    }
  }
}