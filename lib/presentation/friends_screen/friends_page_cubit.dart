import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/friends_repo.dart';
import 'friends_page_state.dart';

class FriendsPageCubit extends Cubit<FriendsPageState> {
  final FriendsRepo friendsRepo;

  FriendsPageCubit({required this.friendsRepo})
      : super(const FriendsPageState.initial());

  void onFriendsPageStarted() async {
    emit(state.copyWith(isResponseLoading: true));
    await friendsRepo
        .getFriendsList()
        .then((value) => emit(state.copyWith(friendsList: value)))
        .whenComplete(() => emit(state.copyWith(isResponseLoading: false)));
  }
}