import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../../services/auth/auth_service.dart';

import '../../common/utils.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository(this._authService);

  Future<void> signUp({required String email, required String password}) async {
    await _authService.signUp(email: email, password: password);
  }

  Future<void> signIn({required String email, required String password}) async {
    await _authService.signIn(email: email, password: password);
  }

  Future<void> handleSignUp({
    required String email,
    required String password,
    required StateController<bool> isLoading,
    required BuildContext context,
  }) async {
    isLoading.state = true;

    try {
      await signUp(email: email, password: password);
      showSnackbar(context, 'Sign Up Successful!');
    } catch (e) {
      showSnackbar(context, e.toString(), isError: true);
    } finally {
      isLoading.state = false;
    }
  }

  Future<void> handleSignIn({
    required String email,
    required String password,
    required StateController<bool> isLoading,
    required BuildContext context,
  }) async {
    isLoading.state = true;

    try {
      await signIn(email: email, password: password);
      showSnackbar(context, 'Sign In Successful!');
    } catch (e) {
      showSnackbar(context, e.toString(), isError: true);
    } finally {
      isLoading.state = false;
    }
  }
}
