import 'package:equatable/equatable.dart';
import 'package:flutter_vk_client/data/models/start_page_photos_model.dart';

import '../../data/models/profile_model.dart';

class UserPageState extends Equatable {
  final bool isResponseLoading;
  final User? userInfo;
  final List<StartPagePhoto>? photoList;

  const UserPageState._({
    this.isResponseLoading = false,
    this.userInfo,
    this.photoList,
  });

  const UserPageState.initial() : this._(isResponseLoading: false);

  UserPageState copyWith({
    bool? isResponseLoading,
    User? userInfo,
    List<StartPagePhoto>? photoList,
  }) {
    return UserPageState._(
      isResponseLoading: isResponseLoading ?? this.isResponseLoading,
      userInfo: userInfo ?? this.userInfo,
      photoList: photoList ?? this.photoList,
    );
  }

  @override
  List<Object?> get props => [
    isResponseLoading,
    userInfo,
    photoList,
  ];
}