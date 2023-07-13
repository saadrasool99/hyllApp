import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'Models/hylldummyModel.dart';

class Utilities{


  Future<DueFeesModel> loadStudentDueFeeData(Map map) async{

    Map token={
      "TableName":"Users",
      "UserName":"saad123",
      "Password":"Saad12345@"
    };
    final responseToken = await http.post(
        Uri.parse('https://ems.theeasyedi.com/api/Users/UserLogin'),
        headers: {
          "Accept": "application/json",
          "content-type":"application/json"
        },
        body: jsonEncode( token)
    );
    String tokens="";
    if(responseToken.statusCode==200)
    {
      tokens=jsonDecode(responseToken.body.trim())['token'];
      if (kDebugMode) {
        print("tokens :$tokens");
      }
    }
    final response = await http.post(
        Uri.parse('https://ems.theeasyedi.com/api/Student/PendingDueMonthsFee'),
        headers: {
          "Accept": "application/json",
          "content-type":"application/json",
          "Authorization":"Bearer $tokens"

        },

        body: jsonEncode( map)
    );



    if (response.statusCode == 200) {
      // Successful request
      // print(response.body);
    } else {
      // Request failed
      print('Request failed with status: ${response.statusCode}.');
    }
    const JsonDecoder decoder = JsonDecoder();
    print("Data Due Fees:${response.body}");
    // Map maps=decoder.convert(response.body);
    //Map maps=jsonDecode(response.body);
    // var body=jsonDecode(response.body);
    String jsonString = '{"name": "John", "age": 30, "isStudent": true}';
    print("Data Due Fees Map:${jsonDecode(response.body.trim())}");
    Map<String, dynamic> jsonMap = jsonDecode(jsonDecode(response.body.trim()));
    print("Data Due Fees Map:${jsonMap}");
    return DueFeesModel.fromJson(jsonMap);
  }



}