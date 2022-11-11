import 'package:flutter_vk_client/core/services/http_client.dart';
import 'package:flutter_vk_client/core/services/shared_preferences_service.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories/auth_repo.dart';
import '../data/repositories/friends_repo.dart';
import '../data/repositories/user_page_repo.dart';
import '../presentation/authorisation/auth_cubit.dart';
import '../presentation/friends_screen/friends_page_cubit.dart';
import '../presentation/main_screen/main_cubit.dart';
import '../presentation/user_page_screen/user_page_cubit.dart';

final GetIt locator = GetIt.instance;
bool isLocatorInitialized = false;

Future setupLocator() async {
  await locator.reset();
  _setupServices();
  _setupRepositories();
  _setupBlocs();

  isLocatorInitialized = true;
  return isLocatorInitialized;
}

void _setupServices() {
  locator.registerSingleton(HttpClientService());
  locator.registerSingleton(SharedPreferencesService());
}

void _setupBlocs() {
  locator.registerSingleton(BottomNavCubit());

  locator.registerSingleton(AuthCubit(
    authRepo: locator.get(),
    sharedPreferencesService: locator.get(),
  ));
  locator.registerSingleton(UserPageCubit(
    userRepo: locator.get(),
  ));
  locator.registerSingleton(
    FriendsPageCubit(
      friendsRepo: locator.get(),
    ),
  );
}

void _setupRepositories() {
  locator.registerSingleton(
    AuthRepo(
      httpClient: locator.get(),
      sharedPreferencesService: locator.get(),
    ),
  );
  locator.registerSingleton(UserRepo(
    httpClient: locator.get(),
    sharedPreferencesService: locator.get(),
  ));
  locator.registerSingleton(
    FriendsRepo(
      httpClient: locator.get(),
      sharedPreferencesService: locator.get(),
    ),
  );
}

void resetLocator() {}
