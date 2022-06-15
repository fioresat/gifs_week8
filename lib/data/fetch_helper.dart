import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

import 'consts.dart';

class FetchHelper {
  final String baseUrl;
  final String request;
  final String parameters;
  final int limit;

  FetchHelper({
    this.baseUrl = Consts.baseUrl,
    this.request = Consts.getGifRequest,
    this.parameters = '',
    this.limit = Consts.gifLimit,
  });

  Future<dynamic> getData() async {
    print('Request...');
    final fullUrl =
        '$baseUrl$request?api_key=${Consts.openGifMapKey}&$parameters&limit=$limit&offset=0&rating=g&lang=en';
    //https://api.giphy.com/v1/gifs/   search?   api_key=API_KEY_HERE  &q=cats &limit=12 &offset=0&rating=g&lang=en
    http.Response response = await http.get(Uri.parse(fullUrl));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print('Response:\n$body');
      return body;
    } else {
      print(response.statusCode);
    }
  }
}
