import 'dart:io';

import 'package:injectable/injectable.dart';

@lazySingleton
class HeaderHelper {
  Future<Map<String, dynamic>> generateHeaders() async {
    final Map<String, dynamic> headers = {};
    headers[HttpHeaders.contentTypeHeader] = 'application/json; charset=utf-8';
    return headers;
  }
}
