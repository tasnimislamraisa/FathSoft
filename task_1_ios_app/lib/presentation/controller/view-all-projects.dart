import 'package:http/http.dart' as http;
import 'package:task_1_ios_app/data/models/projects-model/project-model.dart';
import 'package:task_1_ios_app/my-imports.dart';

Future<List<Project>> ViewAllProjects() async {
  try {
    final authController = Get.find<AuthController>();
    final logger = Get.find<Logger>();

    final token = await authController.getAccessToken();
    if (token == null) {
      logger.e("Token is null. Cannot proceed.");
      throw Exception('Authorization token not found');
    }

    final response = await http.get(
      Uri.parse(Urls.viewAllProjectsUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    logger.i("Fetching projects: Status ${response.statusCode}");

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> projectsJson = jsonData['projects'];
      final projects = projectsJson.map((e) => Project.fromJson(e)).toList();
      logger.i("Projects fetched successfully: ${projects.length} items");
      return projects;
    } else {
      logger.e('Failed to load projects: ${response.body}');
      throw Exception('Failed to load projects: ${response.statusCode}');
    }
  } catch (e, stackTrace) {
    final logger = Get.isRegistered<Logger>() ? Get.find<Logger>() : null;
    logger?.e("Exception while fetching projects",
        error: e, stackTrace: stackTrace);
    rethrow;
  }
}
