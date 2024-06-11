import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import '../../services/auth/auth_service.dart';

class LoginScreen extends StatelessWidget {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  void _showSnackbar(BuildContext context, String message,
      {bool isError = false}) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: isError ? Colors.white : Colors.white),
      ),
      backgroundColor: isError ? Colors.red : Colors.black,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _handleSignUp(BuildContext context) async {
    var result = await _authService.signUp(
        _emailController.text, _passwordController.text);
    result.fold(
      (error) => _showSnackbar(context, error, isError: true),
      (_) => _showSnackbar(context, 'Sign In Successful!'),
    );
  }

  Future<void> _handleSignIn(BuildContext context) async {
    Either<String, bool> result = await _authService.signIn(
        _emailController.text, _passwordController.text);
    result.fold(
      (error) => _showSnackbar(context, error, isError: true),
      (_) => _showSnackbar(context, 'Sign In Successful!'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _handleSignUp(context),
                  child: const Text('Sign Up'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _handleSignIn(context),
                  child: const Text('Sign In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
