import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../auth_service.dart';

part 'auth_service_provider.g.dart';

@riverpod
AuthService authService(AuthServiceRef ref) {
  return AuthService();
}
