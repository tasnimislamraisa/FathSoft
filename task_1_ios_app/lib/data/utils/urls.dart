class Urls {
  static const String _baseUrl =
      'https://user-authentication-production-106c.up.railway.app/api';
  static const String registerUrl = "$_baseUrl/auth/register";
  static const String logInUrl = '$_baseUrl/auth/login';
  static const String createProjectUrl = '$_baseUrl/project/create?';
  static const String viewAllProjectsUrl = '$_baseUrl/project/all';
  static const String projectViewByProductIDUrl = '$_baseUrl/project/get';
}
