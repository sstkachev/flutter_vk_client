import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../core/services/shared_preferences_service.dart';
import '../../data/repositories/auth_repo.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  final SharedPreferencesService sharedPreferencesService;

  AuthCubit({
    required this.authRepo,
    required this.sharedPreferencesService,
  }) : super(const AuthState.initial());

  String getInitialUrl() {
    return authRepo.initialUrl;
  }

  void onAuthPageFinished(String value) {
    authRepo.readResponse(value);
    if (authRepo.token != null && authRepo.id != null) {
      emit(state.copyWith(isTokenAvailable: true));
    }
  }

  void _onAuthChanged(bool isTokenAvailable) {
    emit(state.copyWith(isTokenAvailable: isTokenAvailable));
  }

  void onAuthScreenStarted() {
    authRepo.onAuthChanged().listen((event) {
      _onAuthChanged(event);
    });
  }

  void onTapExit() {
    authRepo.clearToken();
    changeTokenAvailability();
    emit(state.copyWith(isLogout: true));
  }

  void changeTokenAvailability() {
    emit(state.copyWith(isTokenAvailable: false));
  }

  Completer<WebViewController> getController() {
    return authRepo.controller;
  }
}
