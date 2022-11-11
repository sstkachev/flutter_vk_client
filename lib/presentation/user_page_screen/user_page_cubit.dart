import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vk_client/presentation/user_page_screen/user_page_state.dart';

import '../../data/repositories/user_page_repo.dart';

class UserPageCubit extends Cubit<UserPageState> {
  final UserRepo userRepo;

  UserPageCubit({
    required this.userRepo,
  }) : super(const UserPageState.initial());

  void onUserPageStarted() async {
    emit(state.copyWith(isResponseLoading: true));
    await userRepo
        .getUserInfo()
        .then((value) => emit(state.copyWith(userInfo: value)))
        .whenComplete(() => emit(state.copyWith(isResponseLoading: false)));

  }

  void onUserPagePhotoLoading() async {
    emit(state.copyWith(isResponseLoading: true));
    await userRepo
        .getStartPagePhotos()
        .then((value) => emit(state.copyWith(photoList: value)))
        .whenComplete(() => emit(state.copyWith(isResponseLoading: false)));
  }
}
