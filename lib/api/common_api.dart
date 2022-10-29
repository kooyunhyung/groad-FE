import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import '../state/auth_state.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as Http;
import '../util/api_utilites.dart';

class CommonAPI {
  final BuildContext context;
  final Map<String, dynamic> defaultHeader;
  final bool listen;

  CommonAPI(this.context, { this.defaultHeader,  this.listen});

  Future<Map<String, String>> get headers async {
    final authState = context != null
        ? ((listen ?? false)
        ? context.watch<AuthState>()
        : context.read<AuthState>())
        : null;

    return {
      if (context != null && authState.isLogin)
        HttpHeaders.cookieHeader: authState.token,
      HttpHeaders.contentTypeHeader: 'application/json'
    };
  }

  Future<Http.Response> get(
      String path, {
        Map<String, String> headers,
        Map<String, dynamic> params,
      }) async {
    final response =
    await Http.get(Uri.parse(createUri(path, params)), headers: {
      if (this.headers != null) ...await this.headers,
      if (this.defaultHeader != null) ...?this.defaultHeader,
      if (headers != null) ...headers
    });
    if (response.statusCode != 200) {
      print(Uri.parse(createUri(path, params)));
      print(response.statusCode);
      print(jsonDecode(response.body));
      print(response.statusCode);
      throw Exception(['알 수 없는 에러가 발생했습니다.']);
    }

    return response;
  }

  Future<Http.Response> getWeather(
      String path, {
        Map<String, String> headers,
        Map<String, dynamic> params,
      }) async {
    final response =
    await Http.get(Uri.parse(path), headers: {
      if (this.headers != null) ...await this.headers,
      if (this.defaultHeader != null) ...?this.defaultHeader,
      if (headers != null) ...headers
    });
    if (response.statusCode != 200) {
      print(Uri.parse(createUri(path, params)));
      print(response.statusCode);
      print(jsonDecode(response.body));
      print(response.statusCode);
      throw Exception(['알 수 없는 에러가 발생했습니다.']);
    }

    return response;
  }

  Future<Http.Response> getPath(
      String path, {
        Map<String, String> headers,
        Map<String, dynamic> params,
      }) async {
    final response =
    await Http.get(Uri.parse(path), headers: {
      if (this.headers != null) ...await this.headers,
      if (this.defaultHeader != null) ...?this.defaultHeader,
      if (headers != null) ...headers
    });
    if (response.statusCode != 200) {
      print(Uri.parse(createUri(path, params)));
      print(response.statusCode);
      print(jsonDecode(response.body));
      print(response.statusCode);
      throw Exception(['알 수 없는 에러가 발생했습니다.']);
    }

    return response;
  }

  Future<Http.Response> post(
      String path, {
        dynamic body,
        Map<String, String> headers,
        Map<String, dynamic> params,
      }) async {
    final response = await Http.post(Uri.parse(createUri(path, params)),
        body: body != null ? jsonEncode(body) : null,
        headers: {
          if (this.headers != null) ...await this.headers,
          if (this.defaultHeader != null) ...?this.defaultHeader,
          if (headers != null) ...headers
        });

    if (response.statusCode != 200) {
      print(Uri.parse(createUri(path, params)));
      print(response.statusCode);
      print(jsonDecode(response.body));
      throw Exception(['알 수 없는 에러가 발생했습니다.']);
    }

    return response;
  }

  Future<Http.Response> put(
      String path, {
        dynamic body,
        Map<String, String> headers,
        Map<String, dynamic> params,
      }) async {
    final response = await Http.put(Uri.parse(createUri(path, params)),
        body: body != null ? jsonEncode(body) : null,
        headers: {
          if (this.headers != null) ...await this.headers,
          if (this.defaultHeader != null) ...?this.defaultHeader,
          if (headers != null) ...headers
        });

    if (response.statusCode != 200) {
      print(Uri.parse(createUri(path, params)));
      print(response.statusCode);
      print(jsonDecode(response.body));
      throw Exception(['알 수 없는 에러가 발생했습니다.']);
    }

    return response;
  }

  Future<Http.Response> delete(
      String path, {
        dynamic body,
        Map<String, String> headers,
        Map<String, dynamic> params,
      }) async {
    final response = await Http.delete(Uri.parse(createUri(path, params)),
        body: body != null ? jsonEncode(body) : null,
        headers: {
          if (this.headers != null) ...await this.headers,
          if (this.defaultHeader != null) ...?this.defaultHeader,
          if (headers != null) ...headers
        });
    if (response.statusCode != 200) {
      throw Exception(['알 수 없는 에러가 발생했습니다.']);
    }

    return response;
  }
}
