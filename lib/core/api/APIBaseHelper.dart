import 'dart:io';
import '../api/AppException.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class APIBaseHelper {
  static String _baseUrl =
      "tournaments-dot-game-tv-prod.uc.r.appspot.com"; //staging
  static String _dummyUrl =
      "https://6020464e46f1e4001780315c.mockapi.io/api/v1";

  Future<dynamic> get(String url, Map<String, String> queryParameters) async {
    var responseJson;
    try {
      var uri = Uri.http(_baseUrl, url, queryParameters);
      print("URI is $uri");
      final response = await http.get(uri);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net connection');
      throw FetchDataException('No Internet connection');
    }
    print('api $url recieved!');
    return responseJson;
  }

  Future<dynamic> getDummy(String url) async {
    var responseJson;
    try {
      final response = await http.get(_dummyUrl + url);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net connection');
      throw FetchDataException('No Internet connection');
    }
    print('api $url recieved!');
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
