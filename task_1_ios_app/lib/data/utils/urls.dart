class Urls {
  static const String _baseUrl =
      'https://user-authentication-production-106c.up.railway.app/api/auth';
  static const String registerUrl = "$_baseUrl/register";
  static const String logInUrl = '$_baseUrl/login';
  static String updateProject(int projectId) =>
      'https://user-authentication-production-106c.up.railway.app/api/project/update/$projectId';
  static String DeleteProject(int projectId) =>
      'https://user-authentication-production-106c.up.railway.app/api/project/delete/$projectId';
}
