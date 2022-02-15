import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:solo_luxury/utils/process_indicator.dart';
import 'package:http/http.dart' as http;

class NetworkHttp {
  static Circle processIndicator = new Circle();
  static final dataStorage = GetStorage();
  static final String? token = dataStorage.read('token');
  // static ProgressDialog pr;
  static Future<Map<String, String>> getHeaders() async {
    if (token != null) {
      return {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'authorization': '$token',
      };
    } else {
      return {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
    }
  }

  static Future<Map<String, String>> getformData() async {
    if (token != null) {
      return {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'authorization': '$token', //Bearer
      };
    } else {
      return {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
    }
  }

  static Future<Map<String?, dynamic>> getHttpMethod(String url,
      {BuildContext? context}) async {
    if (context != null) await processIndicator.show(context);

    http.Response response = await http.get(
      Uri.parse(url.toString()),
      headers: await getHeaders(),
    );
    Map<String, dynamic> responseJson = {
      'body': json.decode(response.body),
      'headers': response.headers
    };
    if (context != null) processIndicator.hide(context);

    return responseJson;
  }

  static Future<String> postformDataMethod(String url, File file,
      {BuildContext? context}) async {
    if (context != null) await processIndicator.show(context);
    // create multipart request for POST method
    var request = http.MultipartRequest("POST", Uri.parse(url));
    // add text fields if exist
    request.fields["text_field"] = 'text';
    // create multipart using filepath, string or bytes
    // for (int i = 0; i < files.length; i++) {
    request.files.add(await http.MultipartFile.fromPath("files", file.path));

    // }
    // add multipart to request
    var response = await request.send();
    if (context != null) processIndicator.hide(context);
    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);

    return responseString;
  }

  static Future<Map<String, dynamic>> postHttpMethod(String url, body,
      {BuildContext? context}) async {
    if (context != null) await processIndicator.show(context);
    http.Response response = await http.post(
      Uri.parse(url.toString()),
      headers: await getHeaders(),
      body: json.encode(body),
    );

    Map<String, dynamic> responseJson = {
      'body': json.decode(response.body),
      'headers': response.headers
    };
    if (context != null) processIndicator.hide(context);
    return responseJson;
  }

  static Future<Map<String, dynamic>> deleteHttpMethod(String url,
      {BuildContext? context}) async {
    if (context != null) await processIndicator.show(context);
    http.Response response = await http.delete(
      Uri.parse(url),
      headers: await getHeaders(),
    );
    Map<String, dynamic> responseJson = {
      'body': json.decode(response.body),
      'headers': response.headers
    };
    if (context != null) processIndicator.hide(context);
    return responseJson;
  }

  static Future<Map<String, dynamic>> putHttpMethod(String url, body,
      {BuildContext? context}) async {
    if (context != null) await processIndicator.show(context);
    http.Response response = await http.put(
      Uri.parse(url.toString()),
      headers: await getHeaders(),
      body: json.encode(body),
    );
    Map<String, dynamic> responseJson = {
      'body': json.decode(response.body),
      'headers': response.headers
    };
    if (context != null) processIndicator.hide(context);
    return responseJson;
  }
}
