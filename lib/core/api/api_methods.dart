import 'dart:convert';

import 'package:http/http.dart' as http;
import '../shared/shared_pref.dart';
import 'api_url.dart';

/// all api method with configuration to send http request
class ApiMethods {
  late Map<String, String> headers;

  ApiMethods() {
    headers = {
      "content-type": "application/json",
      'Authorization': 'Bearer ${AppSharedPreferences.getAccToken()}',
      // }"
    };
  }
  Map<String,String> updateMap({
  required Map<String,String> data,
  required Map<String,String> update,
}) {
  if (update == null) return data;
  update.forEach((key, value) {
    data[key] = value;
  });
  return data;
}

  /// using this function for all get requests
  /// when the parameter does not needed set as empty value
  Future<http.Response> get(
      {required String url,
      required Map<String, dynamic> path,
      required Map<String, dynamic> query,
      required Map<String, String> headeradd}) async {
    if (path.isNotEmpty && query.isNotEmpty) {
      return await http.get(ApiUrl(url).getPath(path).getQuery(query).getLink(),
          headers: headers);
    } else if (query.isNotEmpty) {
      return await http.get(ApiUrl(url).getQuery(query).getLink(),
          headers: headers);
    } else if (path.isNotEmpty) {
      return await http.get(ApiUrl(url).getPath(path).getLink(),
          headers: headers);
    } else if (headeradd.isNotEmpty) {
      return http.get(ApiUrl(url).getHeader(headeradd).getLink(),
          headers: updateMap(data: headers,update:headeradd )
          );
    } else {
      return await http.get(ApiUrl(url).getLink(), headers: headers);
    }
  }

  /// using this function for all post requests
  /// when the parameter does not needed set as empty value
  Future<http.Response> post(
      {required String url,
      required body,
      required Map<String, dynamic> query}) async {
    if (body != null && query.isNotEmpty) {
      return await http.post(ApiUrl(url).getQuery(query).getLink(),
          body: jsonEncode(body), headers: headers);
    } else if (query.isNotEmpty) {
      return await http.post(ApiUrl(url).getQuery(query).getLink(),
          headers: headers);
    } else {
      return await http.post(ApiUrl(url).getLink(),
          body: jsonEncode(body), headers: headers);
    }
  }
}
