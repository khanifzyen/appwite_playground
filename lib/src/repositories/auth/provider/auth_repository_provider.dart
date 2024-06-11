import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../auth_repository.dart';
import '../../../services/auth/provider/auth_service_provider.dart';

part 'auth_repository_provider.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthRepository(authService);
}
