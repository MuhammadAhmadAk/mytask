// lib/viewmodels/auth_viewmodel.dart
import 'package:riverpod/riverpod.dart';

import '../repository/auth_repository.dart';

final authProvider = StateNotifierProvider<AuthViewModel, AuthState>(
  (ref) => AuthViewModel(AuthRepository()),
);
final passwordVisibleProvider = StateProvider<bool>((ref) => true);
final rememeberPassProvider = StateProvider<bool>((ref) => false);
final termAndConditonProvider = StateProvider<bool>((ref) => false);

class AuthState {
  final bool isLoading;
  final String? error;

  AuthState({required this.isLoading, this.error});

  factory AuthState.initial() => AuthState(isLoading: false);
}

class AuthViewModel extends StateNotifier<AuthState> {
  final AuthRepository _repository;

  AuthViewModel(this._repository) : super(AuthState.initial());

  Future<bool> login(String email) async {
    state = AuthState(isLoading: true);
    try {
      final result = await _repository.login(email);
      state = AuthState(isLoading: false);
      return result;
    } catch (e) {
      state = AuthState(isLoading: false, error: e.toString());
      return false;
    }
  }

  Future<bool> signup(String name, String email, String password) async {
    state = AuthState(isLoading: true);
    try {
      final result = await _repository.signup(name, email, password);
      state = AuthState(isLoading: false);
      return result;
    } catch (e) {
      state = AuthState(isLoading: false, error: e.toString());
      return false;
    }
  }

  Future<bool> verifyOtp(String otp) async {
    state = AuthState(isLoading: true);
    try {
      final result = await _repository.verifyOtp(otp);
      state = AuthState(isLoading: false);
      return result;
    } catch (e) {
      state = AuthState(isLoading: false, error: e.toString());
      return false;
    }
  }
}
