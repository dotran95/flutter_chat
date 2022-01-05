import 'package:dio/dio.dart';

enum HTTPEncode { json, urlEncode, none }

abstract class Endpoint {
  String get path;

  Map<String, String> get headers;

  HTTPEncode get encode;
}