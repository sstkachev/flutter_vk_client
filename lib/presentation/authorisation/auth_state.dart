import 'package:equatable/equatable.dart';


class AuthState extends Equatable {
  final bool isTokenAvailable;
  final bool isLogout;

  const AuthState._({
    required this.isTokenAvailable,
    required this.isLogout,
  });

  const AuthState.initial()
      : this._(
          isTokenAvailable: true,
          isLogout: true,
        );

  AuthState copyWith({
    bool? isLogout,
    bool? isTokenAvailable,
  }) {
    return AuthState._(
      isTokenAvailable: isTokenAvailable ?? this.isTokenAvailable,
      isLogout: isLogout ?? this.isLogout,
    );
  }

  @override
  List<Object?> get props => [
        isTokenAvailable,
        isLogout,
      ];
}
