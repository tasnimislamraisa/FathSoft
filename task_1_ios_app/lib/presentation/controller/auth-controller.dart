import 'package:http/http.dart' as http;
import 'package:task_1_ios_app/my-imports.dart';

extension StringCasingExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}

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

  Future<Map<String, dynamic>?> loginUser({
    required String email,
    required String password,
  }) async {
    const String url = Urls.logInUrl; // Update accordingly
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        final token = jsonData['token'];

        if (token != null) {
          await saveAccessToken(token);
          return jsonData; //
        }
      } else {
        print('Login failed: ${response.statusCode}');
      }
    } catch (e) {
      print("Login error: $e");
    }
    return null;
  }


  Future<void> clearUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    accessToken = null;
    print('User data cleared, token removed.');
  }
}
