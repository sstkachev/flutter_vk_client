import '../../core/services/http_client.dart';
import '../../core/services/shared_preferences_service.dart';
import '../models/friends_model.dart';

class FriendsRepo {
  final HttpClientService httpClient;
  final SharedPreferencesService sharedPreferencesService;

  FriendsRepo(
      {required this.httpClient, required this.sharedPreferencesService});

  Future<List<Friend>?> getFriendsList() async {
    final token = await sharedPreferencesService.getString(vkToken);

    final id = await sharedPreferencesService.getString(vkId);

    final response = await httpClient.executeGet(
        'https://api.vk.com/method/friends.get?user_ids=$id&fields=bdate,photo_50,country,city,relation&order=hints&access_token=$token&v=5.131');
    if (response.statusCode == 200) {
      final friendsList = FriendsDto.fromJson(response.data);

      return friendsList.response?.items;
    } else {
      throw Exception(response.statusMessage);
    }
  }
}
