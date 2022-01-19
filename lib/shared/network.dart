import 'dart:async';

import 'package:http/http.dart' show Client;


class Network {
  Network();
  Client client = new Client();

  static const String APPLICATION_JSON = 'application/json';
  static const String CONTENT_TYPE = 'application/x-www-form-urlencoded';

  Future<dynamic> getRequest(String url, {bool withToken = true}) async {
    try {
      var headers = {
        'content-type': CONTENT_TYPE,
        'accept': APPLICATION_JSON,
      };
      final response = await client
          .get(
            Uri.parse("$url"),
            headers: headers,
          )
          .timeout(Duration(seconds: 20));

      return response;
    } on TimeoutException catch (_) {
      throw Exception(_);
    }
  }
}
