import 'dart:io';

import 'package:dio/dio.dart';
import 'package:uno/uno.dart';
import 'package:http/http.dart' as http;

void main() {
  //INVERSAO DE CONTROLE:

  // execute(DioClientHttp());
  execute(UnoClientHttp());
}

abstract class ClientHttp {
  Future get(String url);
  Future post(String url, body);
}

void execute(ClientHttp client) async {
  final response =
      await client.get('https://jsonplaceholder.typicode.com/posts');
  print(response);
}

//Dio
class DioClientHttp implements ClientHttp {
  final dio = Dio();

  @override
  Future get(String url) async {
    final response = await dio.get(url);
    return response.data;
  }

  @override
  Future post(String url, body) async {
    final response = await dio.post(url, data: body);
    return response.data;
  }
}

// Uno
class UnoClientHttp implements ClientHttp {
  final uno = Uno();

  @override
  Future get(String url) async {
    final response = await uno.get(url);
    return response.data;
  }

  @override
  Future post(String url, body) async {
    final response = await uno.post(url, data: body);
    return response.data;
  }
}
