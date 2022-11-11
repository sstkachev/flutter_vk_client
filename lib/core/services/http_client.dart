import 'package:dio/dio.dart';

class HttpClientService {
  final Dio _internalClient = Dio();

  Future<Response> executeGet(String url) {
    return _internalClient.get(url);
  }
}