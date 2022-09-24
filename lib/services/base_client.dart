import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:activities_app/services/app_exception.dart';
import 'package:http/http.dart' as http;

class BaseClient {
  final String _baseUrl = 'http://54.193.146.246';
  final int _timeOutDuration = 10;
  final Map<String, String>? _headers = {"Content-Type": "application/json"};

  Future<dynamic> get(String api) async {
    var uri = Uri.parse(_baseUrl + api);
    try {
      var response =
          await http.get(uri).timeout(Duration(seconds: _timeOutDuration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'Api not responded in time', uri.toString());
    }
  }

  Future<dynamic> post(String api, dynamic payload) async {
    var uri = Uri.parse(_baseUrl + api);
    try {
      var response = await http
          .post(uri, body: payload, headers: _headers)
          .timeout(Duration(seconds: _timeOutDuration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'Api not responded in time', uri.toString());
    }
  }

  Future<dynamic> put(String api, dynamic payloadObj) async {
    var uri = Uri.parse(_baseUrl + api);
    try {
      var response = await http
          .put(uri, body: payloadObj, headers: _headers)
          .timeout(Duration(seconds: _timeOutDuration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'Api not responded in time', uri.toString());
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request?.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request?.url.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured with code : ${response.statusCode}',
            response.request?.url.toString());
    }
  }
}
