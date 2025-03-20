import 'package:task_1_ios_app/my-imports.dart';

class AuthController {
  static String? accessToken;
  final String _accessTokenKey = 'access-token';

  Future<void> saveAccessToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessTokenKey, token);
    accessToken = token;
    print('Token saved: $token');
  }

  Future<String?> getAccessToken() async {
    if (accessToken != null) {
      // If token is already in memory, return it
      return accessToken;
    }
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString(_accessTokenKey);
    accessToken = token;
    print('Token retrieved from SharedPreferences: $token');
    return token;
  }

  Future<bool> isLoggedIn() async {
    String? token = await getAccessToken();
    return token != null;
  }

  Future<void> clearUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    accessToken = null;
    print('User data cleared, token removed.');
  }
}
