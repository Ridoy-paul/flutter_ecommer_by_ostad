import 'dart:convert';
import 'package:http/http.dart';
import 'response_data.dart';

class NetworkCaller  {
  Future<ResponseData> getRequest(String url) async {
    final Response response = await get(Uri.parse(url));
    if(response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      if(decodedResponse['msg'] == 'success') {
        return ResponseData(isSuccess: true, statusCode: response.statusCode, responseData: decodedResponse);
      }
      else {
        return ResponseData(isSuccess: false, statusCode: response.statusCode, responseData: decodedResponse);
      }
    }
    else {
      return ResponseData(isSuccess: false, statusCode: response.statusCode, responseData: '');
    }
  }
}