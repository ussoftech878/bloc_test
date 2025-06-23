import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiBaseHelper {
   static final String _baseURL =
      "https://jsonplaceholder.typicode.com/posts/1";
  //final _baseURL = BaseUrls.prodUrl.url;
  /* SharedPref sharedPref = SharedPref(); */
  

  String? authtoken;

  
  Future<dynamic> httpRequest(
      {
      required String requestType,
      var requestBody,
      required String params,
      String? imagePath}) async {
     
      try {
        switch (requestType) {
          case 'GET':
            final responseJson = await http.get(
                Uri.parse(_baseURL),
                headers: getHeaders());

            return jsonDecode(responseJson.body);
          case 'POST':
            final responseJson = await http.post(
                Uri.parse(_baseURL),
                headers: getHeaders(),
                body: jsonEncode(requestBody));

            return jsonDecode(responseJson.body);
          case 'PUT':
            final responseJson = await http.put(
                Uri.parse(_baseURL),
                headers: getHeaders(),
                body: requestBody != '' ? jsonEncode(requestBody) : null);

            return jsonDecode(responseJson.body);
          case 'DEL':
            final responseJson = await http.delete(
              Uri.parse(_baseURL),
              headers: getHeaders(),
            );

            return jsonDecode(responseJson.body);

          case "PATCH":
            final responseJson = await http.patch(
                Uri.parse(_baseURL),
                headers: getHeaders(),
                body: requestBody != '' ? jsonEncode(requestBody) : null);

            return jsonDecode(responseJson.body);
          case 'MULTIPART':
            final request = http.MultipartRequest(
                'POST', Uri.parse(_baseURL));
            request.fields.addAll(requestBody!.toJson());
            request.files
                .add(await http.MultipartFile.fromPath('image', imagePath!));
            request.headers.addAll(getHeaders());
            final responseJson = await request.send();
            final responseBody = await responseJson.stream.bytesToString();
            return jsonDecode(responseBody);
        }
      } catch (e) {
        SnackBar(content: Text(e.toString()));
      }
    

    //}
  }

  Map<String, String> getHeaders() {
    Map<String, String> headers = {};
    headers.putIfAbsent('Content-Type', () => 'application/json');
    headers.putIfAbsent('Accept', () => 'application/json');
    headers.putIfAbsent('Authorization', () => 'Bearer ${authtoken ?? ""}');

    return headers;
  }

  /*  Map<String, String> getHeader(Map<String, String> Headers) {
    Map<String, String> headers;
    headers = Headers;
    headers.putIfAbsent('Content-Type', () => 'application/json');
    headers.putIfAbsent('Accept', () => 'application/json');
    headers.putIfAbsent('Authorization', () => 'Bearer ${authtoken ?? ""}');

    return headers;
  } */

  /* Future<void> checkStatus(response) async {
    if (response == 400) {
      Navigator.push(navigatorKey.currentContext!,
          MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  } */
}
