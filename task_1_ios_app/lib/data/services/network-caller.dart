import 'package:http/http.dart' as http;
import 'package:task_1_ios_app/my-imports.dart';

class NetworkCaller {
  final Logger logger;
  final AuthController authController;
  NetworkCaller({required this.logger, required this.authController});

  Future<NetworkResponse> getRequest({
    required String url,
    String? token,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      _requestLog(url, {}, {}, '');
      final http.Response response = await http.get(
        uri,
        headers: {
          'token': '${token ?? AuthController.accessToken}',
        },
      );
      if (response.statusCode == 200) {
        _responseLog(
            true, url, response.statusCode, response.body, response.headers);
        final decodedBody = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodedBody,
        );
      } else {
        _responseLog(
            false, url, response.statusCode, response.body, response.headers);
        if (response.statusCode == 401) {
          _movedToLogin();
        }
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      _responseLog(false, url, -1, {}, {}, e);
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMsg: e.toString(),
      );
    }
  }

  Future<NetworkResponse> postRequest({
    required String url,
    required String? token,
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      _requestLog(url, {}, body ?? {}, AuthController.accessToken ?? 'Null');
      final http.Response response = await http.post(
        uri,
        body: jsonEncode(body),
        headers: {
          'token': token ?? '${AuthController.accessToken}',
          'content-type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        _responseLog(
            true, url, response.statusCode, response.body, response.headers);
        final decodedBody = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodedBody,
        );
      } else {
        if (response.statusCode == 401) {
          _movedToLogin();
        }
        _responseLog(
            false, url, response.statusCode, response.body, response.headers);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      _responseLog(false, url, -1, {}, {}, e);
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMsg: e.toString(),
      );
    }
  }
  Future<NetworkResponse> putRequest({
    required String url,
    required String? token,
    Map<String, dynamic>? body,
  }) async {
    try {
      final String finalToken = token ?? AuthController.accessToken ?? '';

      final response = await http.put(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          if (finalToken.isNotEmpty)
            'Authorization': 'Bearer $finalToken',
        },
        body: jsonEncode(body),
      );

      _responseLog(
        response.statusCode == 200,
        url,
        response.statusCode,
        response.body,
        response.headers,
      );

      if (response.statusCode == 200) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: jsonDecode(response.body),
        );
      } else {
        if (response.statusCode == 401) {
          await _movedToLogin();
        }
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMsg: response.body,
        );
      }
    } catch (e) {
      _responseLog(false, url, -1, {}, {}, e);
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMsg: e.toString(),
      );
    }
  }
  Future<NetworkResponse> deleteRequest({
    required String url,
    String? token,
  }) async {
    try {
      final String finalToken = token ?? AuthController.accessToken ?? '';
      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          if (finalToken.isNotEmpty)
            'Authorization': 'Bearer $finalToken',
        },
      );

      _responseLog(
        response.statusCode == 200,
        url,
        response.statusCode,
        response.body,
        response.headers,
      );

      if (response.statusCode == 200) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: jsonDecode(response.body),
        );
      } else {
        if (response.statusCode == 401) {
          await _movedToLogin();
        }
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMsg: response.body,
        );
      }
    } catch (e) {
      _responseLog(false, url, -1, {}, {}, e);
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMsg: e.toString(),
      );
    }
  }

  void _requestLog(String url, Map<String, dynamic> params,
      Map<String, dynamic> body, String token) {
    logger.i('''
    Url : $url
    Params : $params
    Body : $body
    Token : $token
    ''');
  }

  void _responseLog(bool isSuccess, String url, int statusCode,
      dynamic responseBody, Map<String, dynamic> headers,
      [dynamic error]) {
    String message = '''
     Url : $url   
     StatusCode : $statusCode
     Headers : $headers
     ResponseBody : $responseBody   
     Error : $error
    ''';
    if (isSuccess) {
      logger.i(message);
    } else {
      logger.e(message);
    }
  }

  Future<void> _movedToLogin() async {
    await authController.clearUserData();
    Get.to(() => const LogInScreen());
  }
}
