import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:graduation/core/data/enum/request_type.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;
import 'package:http_parser/http_parser.dart';


class NetworkUtil {
  static String baseUrl = "final-ehle.onrender.com";


  static var client = http.Client();

  static Future<dynamic> sendRequest(
      {required RequestType type,
      required String url,
      Map<String, dynamic>? params,
      Map<String, String>? headers,
      Map<String, dynamic>? body,
  }) async {
    log(body.toString());
    try {
      var uri = 
           Uri.https(baseUrl, url, params);
         
      log(uri.toString());

      late http.Response response;

      Map<String, dynamic> jsonRespons = {};

      switch (type) {
        case RequestType.GET:
          response = await client
              .get(uri, headers: headers)
              .timeout(const Duration(seconds: 30), onTimeout: () {
            return response;
          });

          break;
        case RequestType.POST:
          response = await client
              .post(uri, headers: headers, body: jsonEncode(body))
              .timeout(Duration(seconds: 30), onTimeout: () {
            return response;
          });
          ;
          break;
        case RequestType.PUT:
          response = await client
              .put(uri, headers: headers, body: jsonEncode(body))
              .timeout(Duration(seconds: 30), onTimeout: () {
            return response;
          });
          ;
          break;
        case RequestType.DELETE:
          response = await client
              .delete(uri, headers: headers, body: jsonEncode(body))
              .timeout(Duration(seconds: 30), onTimeout: () {
            return response;
          });
          ;
          break;
        case RequestType.MULTIPART:
          break;
      }

      dynamic result;
      try {
        result = jsonDecode(utf8.decode(response.bodyBytes));
      } catch (e) {}

      jsonRespons.putIfAbsent('statusCode', () => response.statusCode);
      jsonRespons.putIfAbsent(
          'response',
          () => result != null
              ? jsonDecode(utf8.decode(response.bodyBytes))
              : {'success': utf8.decode(response.bodyBytes)});
     log(jsonRespons.toString(),name: 'jsonRespons');
      return jsonRespons;
    } catch (e) {
      print(e);
      print("error from network utils");
    }
  }

  static Future<dynamic> sendMultipartRequest({
    required String url,
    required RequestType type,
    Map<String, String>? headers = const {},
    Map<String, String>? fields = const {},
    Map<String, RxList<String>>? files = const {},
    Map<String, dynamic>? params,
  }) async {
    try {
      var request =
          http.MultipartRequest("POST", Uri.https(baseUrl, url, params));
      var futures = <Future>[];
      files!.forEach((key, value) {
        if (value.isNotEmpty) {
          value.forEach((element) {
            var multipartFile = http.MultipartFile.fromPath(key, element,
                filename: path.basename(element),
                contentType: MediaType.parse(lookupMimeType(element) ?? ''));
            futures.add(multipartFile);
          });
        }

      });
      var multipartFiles = await Future.wait(futures);
      for (var file in multipartFiles) {
        request.files.add(file);
      }

      request.headers.addAll(headers!);
      request.fields.addAll(fields!);

      var response = await request.send();

      Map<String, dynamic> responseJson = {};
      var value;
      try {
        value = await response.stream.bytesToString();
      } catch (e) {
        print(e);
      }

      responseJson.putIfAbsent('statusCode', () => response.statusCode);
      responseJson.putIfAbsent('response', () => jsonDecode(value));
      return responseJson;
    } catch (error) {
      print(error.toString());
    }
  }

}