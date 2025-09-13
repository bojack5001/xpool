import 'dart:convert';

import 'package:http/http.dart' as http;

class RequestAssistant {

  static Future<dynamic> receiveRequest(String url) async{
    http.Response httpsResponse = await http.get(Uri.parse(url));

    try{
      if (httpsResponse.statusCode == 200) //successful
          {
        String responseData = httpsResponse.body; //json
        var decodeResponseData = jsonDecode(responseData);

        return decodeResponseData;
      }
      else{
        return "Error Occurred. Failed. No Response.";
      }
    } catch(exp){
      return "Error Occurred. Failed. No Response.";
    }
  }
}
