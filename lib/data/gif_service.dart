import 'fetch_helper.dart';
import 'dart:async';

class GifService {
  Future<dynamic> getGifByName(String phrase) async {
    FetchHelper fetchData = FetchHelper(parameters: 'q=$phrase');
    var decodedData = await fetchData.getData();
    return decodedData;
  }
}
