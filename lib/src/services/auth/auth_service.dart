import 'package:appwrite/appwrite.dart';
import 'package:dartz/dartz.dart';
import '../appwrite_client.dart';

class AuthService {
  final Account _account;

  AuthService() : _account = Account(AppwriteClient.getInstance());

  Future<Either<String, bool>> signUp(
      {required String email, required String password}) async {
    try {
      await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
      );
      return right(true);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, bool>> signIn(
      {required String email, required String password}) async {
    try {
      await _account.createEmailPasswordSession(
        email: email,
        password: password,
      );
      return right(true);
    } catch (e) {
      return left(e.toString());
    }
  }
}
