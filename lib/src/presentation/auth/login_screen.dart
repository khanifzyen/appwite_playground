import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import '../../services/auth/auth_service.dart';

class LoginScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  LoginScreen({super.key});

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _handleSignUp(BuildContext context) async {
    Either<String, bool> result =
        await _authService.signUp('khanif.zyen@gmail.com', '12345678');
    result.fold(
      (error) => _showSnackbar(context, error),
      (_) => _showSnackbar(context, 'Sign Up Successful!'),
    );
  }

  Future<void> _handleSignIn(BuildContext context) async {
    Either<String, bool> result =
        await _authService.signIn('khanif.zyen@gmail.com', '12345678');
    result.fold(
      (error) => _showSnackbar(context, error),
      (_) => _showSnackbar(context, 'Sign In Successful!'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _handleSignUp(context),
              child: const Text('Sign Up'),
            ),
            ElevatedButton(
              onPressed: () => _handleSignIn(context),
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
