import 'package:http/http.dart';

class AirsayHttpClient {
  final Client _httpClient;

  AirsayHttpClient(this._httpClient);
  
  final Map<String, String> _headers = {'Content-type': 'application/json'};
  final Duration _timeLimit = const Duration(milliseconds: 5000);

  Future<Response> get(String uri) async {
    Response response;
    try {
       response =  await _httpClient.get(Uri.parse(uri), headers: _headers).timeout(_timeLimit);
    } on Exception catch (e) {
      throw Exception(e);
    }

    if(200 <= response.statusCode && response.statusCode < 300){
      return response;
    }

    throw Exception("GET call to $uri was not successful: ${response.statusCode}");
  }

}