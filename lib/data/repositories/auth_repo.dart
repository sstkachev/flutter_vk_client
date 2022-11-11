import 'dart:async';
import 'dart:developer';

import 'package:webview_flutter/webview_flutter.dart';

import '../../core/services/http_client.dart';
import '../../core/services/shared_preferences_service.dart';

class AuthRepo {
  final HttpClientService httpClient;
  final SharedPreferencesService sharedPreferencesService;
  final Completer<WebViewController> controller =
  Completer<WebViewController>();
  final initialUrl =
      'https://oauth.vk.com/authorize?client_id=8212104&display=mobile&redirect_uri=https://oauth.vk.com/blank.html&scope=wall&response_type=token&v=5.131&state=123456';
  String? _token;
  String? _iD;

  StreamSubscription<String>? subscription;

  String? get token => _token;

  String? get id => _iD;

  AuthRepo({
    required this.httpClient,
    required this.sharedPreferencesService,
  });

  void readResponse(String value) {
    log('readResponse method');
    if (value.contains('access_token=')) {
      final str = value;
      const startToken = "token=";
      const endToken = "&expires";
      const startId = "user_id=";
      const endId = "&state";

      final startTokenIndex = str.indexOf(startToken);
      final endTokenIndex =
      str.indexOf(endToken, startTokenIndex + startToken.length);
      final token =
      str.substring(startTokenIndex + startToken.length, endTokenIndex);

      final startIdIndex = str.indexOf(startId);
      final endIdIndex = str.indexOf(endId, startTokenIndex + startId.length);
      final iD = str.substring(startIdIndex + startId.length, endIdIndex);

      _token = token;
      _iD = iD;

      if (_token != null && _iD != null) {
        sharedPreferencesService.setString(vkToken, _token!);
        log('токен добавили в шаред преф');
        sharedPreferencesService.setString(vkId, _iD!);
        //sharedPreferencesService.setBool(access, true);
        log('id: $_iD  token: $_token');
      }
    } else {
      //sharedPreferencesService.setBool(access, false);
      log('Error token response');
    }
  }

  Stream<bool> onAuthChanged() {
    return sharedPreferencesService
        .onChange$(vkToken)
        .map((event) => event != null && event.isNotEmpty);
  }

  void clearToken() {
    sharedPreferencesService.remove(vkToken);
    _token = null;
    _iD = null;
  }
}