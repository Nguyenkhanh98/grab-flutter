import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@injectable
class GrabAPIInstance {
  String baseUrl = dotenv.env['API_URL'] ?? 'https://api.grab.com';

  Future<Response> get(String path,
      {Map<String, String>? headers, bool isAuth = false}) async {
    final url = Uri.parse('$baseUrl/$path');

    if (isAuth) {
      final box = await Hive.openBox('auth');
      final accessToken = box.get('accessToken');
      headers ??= {};
      headers['Authorization'] = 'Bearer $accessToken';
    }
    final response = await get(url as String, headers: headers);
    return response;
  }

  Future<Response> post(String path,
      {Map<String, String>? headers,
      Map<String, dynamic>? body,
      bool isAuth = true}) async {
    final url = Uri.parse('$baseUrl/$path');
    if (isAuth) {
      final box = await Hive.openBox('auth');
      final accessToken = box.get('accessToken');
      headers ??= {};
      headers['Authorization'] = 'Bearer $accessToken';
    }
    try {
      print('============');
      final response = await post(url.toString(), headers: headers, body: body);
      return response;
    } catch (e) {
      print(e);
      print('------------');

      rethrow;
    }
  }

  Future<Response> put(String path,
      {Map<String, String>? headers,
      Map<String, dynamic>? body,
      bool isAuth = false}) async {
    final url = Uri.parse('$baseUrl/$path');

    if (isAuth) {
      final box = await Hive.openBox('auth');
      final accessToken = box.get('accessToken');
      headers ??= {};
      headers['Authorization'] = 'Bearer $accessToken';
    }
    final response = await put(url as String, headers: headers, body: body);
    return response;
  }

  Future<Response> patch(String path,
      {Map<String, String>? headers,
      Map<String, dynamic>? body,
      bool isAuth = false}) async {
    final url = Uri.parse('$baseUrl/$path');
    if (isAuth) {
      final box = await Hive.openBox('auth');
      final accessToken = box.get('accessToken');
      headers ??= {};
      headers['Authorization'] = 'Bearer $accessToken';
    }
    final response = await patch(url as String, headers: headers, body: body);
    return response;
  }

  Future<Response> delete(String path,
      {Map<String, String>? headers, bool isAuth = false}) async {
    final url = Uri.parse('$baseUrl/$path');
    if (isAuth) {
      final box = await Hive.openBox('auth');
      final accessToken = box.get('accessToken');
      headers ??= {};
      headers['Authorization'] = 'Bearer $accessToken';
    }
    final response = await delete(url as String, headers: headers);
    return response;
  }
}
