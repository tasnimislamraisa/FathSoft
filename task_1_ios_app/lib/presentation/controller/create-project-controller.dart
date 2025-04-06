import 'package:http/http.dart' as http;
import 'package:task_1_ios_app/my-imports.dart';

Future<void> createProject(Map<String, dynamic> projectData) async {
  final authController = AuthController();
  final token = await authController.getAccessToken();

  if (token == null) {
    Get.snackbar('Failed', 'Authorization token missing');
    return;
  }

  // Fallback values for required fields
  projectData['logo'] ??= 'default_logo';
  projectData['architect_drawing_file'] ??= 'default_file';

  try {
    final response = await http.post(
      Uri.parse(Urls.createProjectUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(projectData),
    );

    print("Status: ${response.statusCode}");
    print("Body: ${response.body}");

    final json = jsonDecode(response.body);
    if (response.statusCode == 201 && json['success'] == true) {
      Get.back();
      Get.snackbar('Success', json['message']);
    } else {
      Get.snackbar('Failed', json['message'] ?? 'Something went wrong');
    }
  } catch (e) {
    print('Exception: $e');
    Get.snackbar('Failed', 'Internal Server Error');
  }
}
