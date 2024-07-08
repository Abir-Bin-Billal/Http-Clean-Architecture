import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';

void printValue(dynamic value , {String tag = ''}){
  try{
    var decodedJSON = json.decode(value.toString()) as Map<String , dynamic>;
    log("JSON OUTPUT : $tag ${JsonEncoder.withIndent('  ').convert(decodedJSON)} \n");
  }catch(_){
    if(value is Map){
      log("JSON OUTPUT : $tag ${JsonEncoder.withIndent("").convert(value)}");
    }else{
      if(kDebugMode){
        print("PRINT OUTPUT : $tag $value \n \n");
      }
    }
  }
}