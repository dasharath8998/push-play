import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:pushplay/data/network/api_exceptions.dart';
import 'package:pushplay/data/network/constants_api.dart';

/// Helper class to setup the header or any general setups we need for the api calls
class ApiBaseHelper {
  Future<Map<String, String>> getHeaders(bool isAccessRequired,
      {bool iApiKeyNeeded = false, bool isDeviceUrl = false}) async {
    String token = '';
    if (isAccessRequired) {
      if (FirebaseAuth.instance.currentUser == null) {
        await Future.delayed(const Duration(seconds: 2), () {});
        token = await FirebaseAuth.instance.currentUser!.getIdToken();
      } else {
        token = await FirebaseAuth.instance.currentUser!.getIdToken();
      }
    }
    var headers = {
      "Content-Type": "application/json",
    };
    if (isAccessRequired) {
      headers = {'Authorization': 'Bearer $token', "Content-Type": "application/json"};
    }
    if (iApiKeyNeeded) {
      if (isDeviceUrl) {
        headers.addAll({'x-api-key': ApiConstants.deviceApiKey});
      } else {
        headers.addAll({'x-api-key': ApiConstants.apiKey});
      }
    }
    print(headers);
    return headers;
  }

  /// Request Ends :: can do encode / decode or any other setup required for an API globally
  Future<dynamic> get(BuildContext context, String url,
      {bool isAccessRequired = true, bool isDeviceUrl = false}) async {
    dynamic responseJson;
    Response response;

    String finalUrl = ApiConstants.baseURL + url;
    if (isDeviceUrl) {
      finalUrl = finalUrl.replaceAll('admin', 'device');
    }

    print('Request :: ${Uri.parse(finalUrl).toString()}');
    try {
      Map<String, String> headers = await getHeaders(isAccessRequired,
          isDeviceUrl: isDeviceUrl, iApiKeyNeeded: isDeviceUrl);
      response = await http.get(Uri.parse(finalUrl), headers: headers);
      responseJson = _returnResponse(context, response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } catch (e) {
      print('ApiHelper ===> Exception :: $e');
    }
    return responseJson;
  }

  Future<dynamic> post(BuildContext context, String url, dynamic body,
      {bool isAccessRequired = true}) async {
    dynamic responseJson;
    dynamic response;

    print('Request :: ${Uri.parse(ApiConstants.baseURL + url).toString()}');
    if (body != null) print('Body :: $body');
    try {
      Map<String, String> headers = await getHeaders(isAccessRequired);

      response = await http.post(Uri.parse(ApiConstants.baseURL + url),
          body: body, headers: headers);

      responseJson = _returnResponse(context, response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } catch (e) {
      print(e);
    }

    return responseJson;
  }

  Future<dynamic> putRequest(BuildContext context, String url, dynamic body,
      {bool isAccessRequired = true}) async {
    dynamic responseJson;
    dynamic response;

    print('Request :: ${Uri.parse(ApiConstants.baseURL + url).toString()}');
    print("Params:: ${jsonEncode(body)}");
    try {
      Map<String, String> headers = await getHeaders(isAccessRequired);
      response = await http.put(Uri.parse(ApiConstants.baseURL + url),
          body: body == null ? null : jsonEncode(body), headers: headers);
      responseJson = _returnResponse(context, response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } catch (e) {
      print(e);
    }
    return responseJson;
  }

  Future<dynamic> postMultipart(
      BuildContext context, String url, Uint8List fileInt, String fileName,
      {bool isAccessRequired = true, bool isAdminNeeded = true}) async {
    dynamic responseJson;
    dynamic response;

    try {
      String finalUrl = ApiConstants.baseURL + url;
      if (!isAdminNeeded) {
        finalUrl = finalUrl.replaceAll('/admin', '');
      }
      print('Request :: ${Uri.parse(finalUrl).toString()}');
      var postUri = Uri.parse(finalUrl);
      var request = http.MultipartRequest("POST", postUri);
      try {
        var multipartFile =
            http.MultipartFile.fromBytes('file', fileInt, filename: fileName);
        request.files.add(multipartFile);
      } catch (e) {
        throw FetchDataException('No Internet connection');
      }
      Map<String, String> headers =
          await getHeaders(isAccessRequired, iApiKeyNeeded: !isAdminNeeded);
      request.headers.addAll(headers);
      response = await request.send();
      response = await http.Response.fromStream(response);
      responseJson = _returnResponse(context, response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } catch (e) {
      print(e);
    }
    return responseJson;
  }
}

/// Response handling globally for all the APIs
dynamic _returnResponse(BuildContext context, http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      print('Response :: $responseJson');
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
      throw UnauthorisedException(response.body.toString());
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
