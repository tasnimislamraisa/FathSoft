import 'package:http/http.dart' as http;
import 'package:task_1_ios_app/my-imports.dart';

Future<Map<String, dynamic>> fetchProjectById(int id) async {
  try {
    final authController = Get.find<AuthController>();
    final logger = Get.find<Logger>();
    final token = await authController.getAccessToken();

    final response = await http.get(
      Uri.parse('${Urls.projectViewByProductIDUrl}/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    logger.i("Project fetch status: ${response.statusCode}");

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final project = jsonData['project']; // ✅ Fix here
      if (project == null) throw Exception("Project not found.");
      return project;
    } else {
      logger.e('Failed to fetch project: ${response.body}');
      throw Exception('Failed to fetch project');
    }
  } catch (e) {
    print('Error fetching project by ID: $e');
    rethrow;
  }
}
