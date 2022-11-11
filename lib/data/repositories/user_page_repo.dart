import 'dart:developer';

import 'package:flutter_vk_client/data/models/start_page_photos_model.dart';

import '../../core/services/http_client.dart';
import '../../core/services/shared_preferences_service.dart';
import '../models/profile_model.dart';

class UserRepo {
  final HttpClientService httpClient;
  final SharedPreferencesService sharedPreferencesService;

  UserRepo({required this.httpClient, required this.sharedPreferencesService});

  Future<User?> getUserInfo() async {
    final token = await sharedPreferencesService.getString(vkToken);
    log('$token');
    final id = await sharedPreferencesService.getString(vkId);
    log('$id');
    final response = await httpClient.executeGet(
        'https://api.vk.com/method/users.get?user_ids=$id&fields=bdate,photo_max_orig,country,city,relation&access_token=$token&v=5.131');
    if (response.statusCode == 200) {
      final userInfo = UserInfoList.fromJson(response.data);

      return userInfo.response?.first;
    } else {
      throw Exception(response.statusMessage);
    }
  }

  Future<List<StartPagePhoto>?> getStartPagePhotos() async {
    final token = await sharedPreferencesService.getString(vkToken);

    final id = await sharedPreferencesService.getString(vkId);

    final response = await httpClient.executeGet(
        'https://api.vk.com/method/photos.get?user_ids=$id&album_id=wall&rev=1&extended=1&photo_sizes=1&count=20&access_token=$token&v=5.131');
    if (response.statusCode == 200) {
      final photosList = StartPagePhotosDto.fromJson(response.data);

      return photosList.response?.items;
    } else {
      throw Exception(response.statusMessage);
    }
  }}