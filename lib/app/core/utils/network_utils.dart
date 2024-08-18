import 'dart:convert';
import 'dart:developer';

import 'package:graduation/app/core/enums/request_type.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';

class NetworkUtil {
  static String baseUrl = '192.168.1.14:3000';
  static var client = Client();

  static Future<dynamic> sendRequest({
    required RequestType type,
    required String url,
    Map<String, String>? params,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    log(body.toString(), name: 'BODY');
    log(headers.toString());
    try {
      var uri = Uri.http(baseUrl, url, params);
      log(uri.toString(), name: 'URL');

      late Response response;

      Map<String, dynamic> jsonRespons = {};

      switch (type) {
        case RequestType.get:
          response = await client.get(uri, headers: headers);

          break;
        case RequestType.post:
          response = await client
              .post(uri, headers: headers, body: jsonEncode(body))
              .timeout(const Duration(seconds: 20), onTimeout: () {
            return response;
          });

          break;
        case RequestType.put:
          response = await client
              .put(uri, headers: headers, body: jsonEncode(body))
              .timeout(const Duration(seconds: 20), onTimeout: () {
            return response;
          });

          break;
        case RequestType.delete:
          response = await client
              .delete(uri, headers: headers, body: jsonEncode(body))
              .timeout(const Duration(seconds: 20), onTimeout: () {
            return response;
          });

          break;
        case RequestType.multipart:
          break;
      }

      dynamic result;
      try {
        result = jsonDecode(utf8.decode(response.bodyBytes));
      } catch (e) {
        log(e.toString(), name: 'EXEPTION');
      }


        jsonRespons.putIfAbsent('statusCode', () => response.statusCode);
        jsonRespons.putIfAbsent(
            'response',
            () => result != null
                ? jsonDecode(utf8.decode(response.bodyBytes))
                : {'success': utf8.decode(response.bodyBytes)});
        log(jsonRespons.toString(), name: 'Response');
        return jsonRespons;
      
    } catch (e) {
      log(e.toString(), name: 'EXEPTION');
      log("error from network utils");
    }
  }

 static Future<dynamic> sendMultipartRequest({ 
    required String url, 
    required RequestType type, 
    Map<String, String>? headers = const {}, 
    Map<String, String>? fields = const {}, 
    Map<String, List<String>>? files = const {}, 
    Map<String, dynamic>? params, 
  }) async { 
    try { 
      var uri = Uri.http(baseUrl, url, params); 
      var request = MultipartRequest("POST", uri); 
      log(uri.toString()); 
      log(fields.toString(),name: 'fields');
      log(files.toString(),name: 'files');
      var futures = <Future>[]; 
      files!.forEach((key, value) { 
        if (value.isNotEmpty) { 
          for (var element in value) { 
            var multipartFile = MultipartFile.fromPath(key, element, 
                filename: basename(element), 
                contentType: MediaType.parse(lookupMimeType(element) ?? '')); 
            futures.add(multipartFile); 
          } 
        } 
      }); 
      var multipartFiles = await Future.wait(futures); 
      for (var file in multipartFiles) { 
        request.files.add(file); 
      } 
 
      request.headers.addAll(headers!); 
      request.fields.addAll(fields!); 
 
      var response = await request.send().timeout( 
            const Duration(minutes: 1), 
          ); 
 
      // if (response.statusCode != 200) { 
      //   throw Exception('Time out'); 
      // } 
 
      Map<String, dynamic> responseJson = {}; 
      String? value; 
      try { 
        value = await response.stream.bytesToString(); 
      } catch (e) { 
        print(e); 
      } 
 
      responseJson.putIfAbsent('statusCode', () => response.statusCode); 
      responseJson.putIfAbsent('response', () => jsonDecode(value!)); 
      log(responseJson.toString());
      return responseJson; 
    } catch (error) { 
      print(error.toString()); 
    } 
  }
}
