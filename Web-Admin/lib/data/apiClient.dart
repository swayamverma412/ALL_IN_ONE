import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;
import 'package:http/http.dart' as https;
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendor_shopkeeper/data/AppContent.dart';

import 'errorResponse.dart';

class ApiClient {
  final String appBaseUrl;
  static final String noInternetMessage = 'Connection to API server failed due to internet connection';
  final int timeoutInSeconds = 30;
  String? token;
    SharedPreferences? sharedPreferences;
   Map<String, String>? _mainHeaders;
  var _Headers= {'Content-Type': 'application/json',};
  ApiClient({required this.appBaseUrl});


  Future<Http.Response> getData(String uri,bool header) async {
    Http.Response _response;
    try {
      debugPrint('====> API Call:' +appBaseUrl+uri);
      if(header){
        debugPrint('====> API Call in heder: $uri');
        await updateHeader();
        _response = await Http.get(Uri.parse(appBaseUrl+uri), headers: _mainHeaders,).timeout(Duration(seconds: timeoutInSeconds));
      }else{
        _response = await Http.get(Uri.parse(appBaseUrl+uri)).timeout(Duration(seconds: timeoutInSeconds));
      }
      print(_response.body.toString());
    } catch (e) {
      print("catech"+e.toString());
      final res={
        "message":noInternetMessage+e.toString(),
      };
      _response=Response(jsonEncode(res),400);
    }
    return _response;
  }

  Future<Http.Response> getData_Customerurl(String uri,bool header) async {
    Http.Response _response;
    try {
      debugPrint('====> API Call:' +uri);
      if(header){
        debugPrint('====> API Call in heder: $uri');
        await updateHeader();
        _response = await Http.get(Uri.parse(uri), headers: _mainHeaders,).timeout(Duration(seconds: timeoutInSeconds));
      }else{
        _response = await Http.get(Uri.parse(uri)).timeout(Duration(seconds: timeoutInSeconds));
      }
      print(_response.body.toString());
    } catch (e) {
      print("catech"+e.toString());
      final res={
        "message":noInternetMessage+e.toString(),
      };
      _response=Response(jsonEncode(res),400);
    }
    return _response;
  }


  Future<Http.Response> postData(String uri, dynamic body,) async {
    Http.Response _response;
    try {
      print("login-----"+appBaseUrl+uri);
      print('body -- > '+jsonEncode(body).toString());
      await updateHeader();
      final b1=jsonEncode(body);

     _response = await Http.post(Uri.parse(appBaseUrl+uri), body: b1,headers: _mainHeaders).
     timeout(Duration(seconds: timeoutInSeconds));

     print("res[oS"+_response.body.toString());
    } catch (e) {
      print(e.toString());
      //return Response(statusCode: 1, statusText: noInternetMessage);
      final res={
        "message":noInternetMessage+e.toString(),
      };
      _response=Response(jsonEncode(res),400);
    }
    return _response;
  }


  Future<Http.Response> postMultipartData(String uri, Map<String, String> body, List<MultipartBody> multipartBody,) async {
    Http.Response _response;
    try {
      debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
      debugPrint('====> API Body: $body with ${multipartBody.length} files');
      Http.MultipartRequest _request = Http.MultipartRequest('POST', Uri.parse(appBaseUrl+uri));
      await updateHeader();
      _request.headers.addAll(_mainHeaders!);
      for(MultipartBody multipart in multipartBody) {
        if(multipart.file != null) {
          Uint8List _list = await multipart.file.readAsBytes();
          _request.files.add(Http.MultipartFile(
            multipart.key, multipart.file.readAsBytes().asStream(), _list.length,
            filename: '${DateTime.now().toString()}.png',
          ));
        }
      }
      _request.fields.addAll(body);
       _response = await Http.Response.fromStream(await _request.send());
       print(_response.body.toString());
    } catch (e) {
      final res={
        "message":noInternetMessage+e.toString(),
      };
      _response=Response(jsonEncode(res),400);
    }
    return _response;
  }
  Future<Http.Response> putMultipartData(String uri, Map<String, String> body, List<MultipartBody> multipartBody,) async {
    Http.Response _response;
    try {
      debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
      debugPrint('====> API Body: $body with ${multipartBody.length} files');
      Http.MultipartRequest _request = Http.MultipartRequest('PUT', Uri.parse(appBaseUrl+uri));
      await updateHeader();
      _request.headers.addAll(_mainHeaders!);
      for(MultipartBody multipart in multipartBody) {
        if(multipart.file != null) {
          Uint8List _list = await multipart.file.readAsBytes();
          _request.files.add(Http.MultipartFile(
            multipart.key, multipart.file.readAsBytes().asStream(), _list.length,
            filename: '${DateTime.now().toString()}.png',
          ));
        }
      }
      _request.fields.addAll(body);
      _response = await Http.Response.fromStream(await _request.send());
      print(_response.body.toString());
    } catch (e) {
      final res={
        "message":noInternetMessage+e.toString(),
      };
      _response=Response(jsonEncode(res),400);
    }
    return _response;
  }

  Future<Response> putData(String uri, dynamic body,) async {
    Http.Response _response;
    try {
      debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
      debugPrint('====> API Body: $body');
      await updateHeader();
     _response = await Http.put(
        Uri.parse(appBaseUrl+uri),
        body: jsonEncode(body),
        headers:_mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
    } catch (e) {
      final res={
        "message":noInternetMessage+e.toString(),
      };
      _response=Response(jsonEncode(res),400);
    }
    return _response;
  }

  Future<Response> deleteData(String uri,) async {
    try {
      debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
      await updateHeader();
      Http.Response _response = await Http.delete(
        Uri.parse(appBaseUrl+uri),
        headers: _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(_response, uri);
    } catch (e) {
      return Response(" ", 1);
      //return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<void> updateHeader() async {
    final prefs = await SharedPreferences.getInstance();
    String? token=await prefs.getString(AppContent.TOKEN);
    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'jwt': '$token'
    };
  }


  Response handleResponse(Http.Response response, String uri) {
    dynamic _body;
    try {
      _body = jsonDecode(response.body);
    }catch(e) {}
    Response _response=Response(_body != null ?_body: response.body, _body != null?200:1);

   /* Response _response = Response(
      body: _body != null ? _body : response.body, bodyString: response.body.toString(),
      request: Request(headers: response.request.headers, method: response.request.method, url: response.request.url),
      headers: response.headers, statusCode: response.statusCode, statusText: response.reasonPhrase,
    );*/
    if(_response.statusCode != 200 && _response.body != null && _response.body is !String) {
      if(_response.body.toString().startsWith('{errors: [{code:')) {
        ErrorResponse _errorResponse = ErrorResponse.fromJson(_response.body);
     //   _response = Response(statusCode: _response.statusCode, body: _response.body, statusText: _errorResponse.errors[0].message);
        _response = Response(_errorResponse.errors![0].message.toString(), _response.statusCode);
      }else if(_response.body.toString().startsWith('{message')) {
        _response = Response(_response.body.toString(), 1);
      //  _response = Response(statusCode: _response.statusCode, body: _response.body, statusText: _response.body['message']);
      }
    }else if(_response.statusCode != 200 && _response.body == null) {
      _response = Response(noInternetMessage.toString(),0);
    //  _response = Response(statusCode: 0, statusText: noInternetMessage);
    }
    debugPrint('====> API Response: [${_response.statusCode}] $uri\n${_response.body}');
    return _response;
  }
}
class MultipartBody {
  String key;
  XFile file;

  MultipartBody(this.key, this.file);
}
