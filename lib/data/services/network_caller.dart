import 'dart:convert';
import 'dart:developer';
import '../../presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'response_data.dart';

class NetworkCaller  {

  String token = Get.find<AuthController>().token.toString();

  Future<ResponseData> getRequest(String url) async {
    log(url);
    log(token);
    try {
      final response = await get(
        Uri.parse(url),
        headers: {
          'token': token,
          'Content-type' : 'application/json'
        },
      );
      log(response.statusCode.toString());
      log(response.body.toString());

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        if (decodedResponse['msg'] == 'success') {
          return ResponseData(
            isSuccess: true,
            statusCode: response.statusCode,
            responseData: decodedResponse,
          );
        }
        else {
          return ResponseData(
            isSuccess: false,
            statusCode: response.statusCode,
            responseData: decodedResponse,
            errorMessage: decodedResponse['data'] ?? 'Something went wrong',
          );
        }
      }
      else {
        return ResponseData(
          isSuccess: false,
          statusCode: response.statusCode,
          responseData: '',
        );
      }
    } catch (e) {
      log('Exception occurred: $e');
      return ResponseData(
        isSuccess: false,
        statusCode: 501,
        responseData: '',
        errorMessage: 'An error occurred: $e',
      );
    }
  }

  Future<ResponseData> postRequest(String url, {Map<String, dynamic>? body}) async {
    log(url);

    final response = await post(
      Uri.parse(url),
      headers: {'token': token, 'Content-type': 'application/json'},
      body: jsonEncode(body),
    );

    log(response.statusCode.toString());
    log(response.body.toString());

    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      if (decodedResponse['msg'] == 'success') {
        return ResponseData(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodedResponse,
        );
      } else {
        return ResponseData(
          isSuccess: false,
          statusCode: response.statusCode,
          responseData: decodedResponse,
          errorMessage: decodedResponse['data'] ?? 'Something went wrong',
        );
      }
    } else {
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: '',
      );
    }
  }



}