
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;

import 'endpoints.dart';
//import 'package:path/path.dart' as Path;

class NetworkHandler {
  static final client = http.Client();
  static const storage = FlutterSecureStorage();
  static final _dio = Dio();


  static Future<http.Response> post(var body, String endpoint) async {
    String? token = await NetworkHandler.getToken();

    var response = await client.post(buildUrl(endpoint), body: body, headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization":"$token",
    });

    return response;
  }


  static Future<http.Response> getRequest(var url) async {
    String? token = await NetworkHandler.getToken();
    //print(token);

    var res = await http.get(Uri.parse('$url'), headers: {
      // "Content-Type": "application/json",
      "accept": "application/json",
      "Authorization": "$token",
    });
    //print('get all rates 1: ${res.body}');
    if (res.statusCode != 200) throw Exception('http.get error: statusCode= ${res.statusCode}');
    return res;
  }

  static Future<http.Response> newPost(String endpoint, var params) async {
    var headers = {
      'accept': 'application/json',
    };

    var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

    var url = Uri.parse('$baseUrl$endpoint?$query');
    var res = await http.post(url, headers: headers);

    return res;
  }


  static Future<http.Response> postRequest(String endpoint, var params) async {
    String? token = await NetworkHandler.getToken();

    var headers = {
      'accept': 'application/json',
      "Authorization": "$token",
    };

    var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

    var url = Uri.parse('$baseUrl$endpoint?$query');
    var res = await http.post(url, headers: headers);

    return res;
  }

  static Future<http.Response> putRequest(String endpoint, var params) async {
    String? token = await NetworkHandler.getToken();

    var headers = {
      'accept': 'application/json',
      "Authorization": "$token",
    };

    var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

    var url = Uri.parse('$baseUrl$endpoint?$query');
    var res = await http.put(url, headers: headers);

    return res;
  }

  static Future<http.Response> delRequest(
      var body, String endpoint) async {
    var token = await getToken();
    var response = await client.delete(buildUrl(endpoint), body: body, headers: {
      'Accept' : 'application/json',
      "Authorization": "$token",
    });

    return response;
  }


  static Future<http.Response> get(String endpoint) async {
    var token = await getToken();
    var response = await client.get(buildUrl(endpoint), headers: {
      "Content-Type": "application/json",
      "Authorization": "$token"
    });
    return response;
  }


  static Uri buildUrl(String endpoint) {
    String host = baseUrl;
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }

  static void storeToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  static void storeUserDetails(int id, String name, String? photo) async {
    await storage.write(key: 'id', value: id.toString());
    await storage.write(key: 'name', value: name);
    await storage.write(key: 'photo', value: photo);
  }

  static void updateUserDetails(String name, String? photo) async {
    await storage.write(key: 'name', value: name);
    await storage.write(key: 'photo', value: photo);

  }
  static Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }
  static Future<String?> getName() async {
    return await storage.read(key: 'name');
  }
  static Future<String?> getPhoto() async {
    return await storage.read(key: 'photo');
  }

  static Future<String?> getUserId() async {
    return await storage.read(key: 'id');
  }

  static clearToken() async {
    await storage.delete(key: 'token');
    await storage.delete(key: 'photo');
    await storage.delete(key: 'name');
    return await storage.delete(key: 'id');

  }


}
