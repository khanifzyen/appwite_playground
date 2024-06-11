import 'package:appwrite/appwrite.dart';
import '../common/constants.dart';

class AppwriteClient {
  static Client? _client;

  static Client getInstance() {
    _client ??= Client()
      ..setEndpoint(appwriteEndPoint)
      ..setProject(appwriteProjectId);
    return _client!;
  }
}
