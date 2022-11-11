import 'package:equatable/equatable.dart';

import '../../data/models/friends_model.dart';

class FriendsPageState extends Equatable {
  final bool isResponseLoading;
  final List<Friend>? friendsList;

  const FriendsPageState._({
    this.isResponseLoading = false,
    this.friendsList,
  });

  const FriendsPageState.initial() : this._(isResponseLoading: false);

  FriendsPageState copyWith({
    bool? isResponseLoading,
    List<Friend>? friendsList,
  }) {
    return FriendsPageState._(
      isResponseLoading: isResponseLoading ?? this.isResponseLoading,
      friendsList: friendsList ?? this.friendsList,
    );
  }

  @override
  List<Object?> get props => [
    isResponseLoading,
    friendsList,
  ];
}