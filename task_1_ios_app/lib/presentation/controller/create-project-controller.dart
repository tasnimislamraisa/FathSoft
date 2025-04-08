import 'package:http/http.dart' as http;
import 'package:task_1_ios_app/data/models/projects-model/create-project-model.dart';
import 'package:task_1_ios_app/my-imports.dart';

Future<void> createProjectApi(CreateProjectModel model) async {
  const url = Urls.createProjectUrl;
  final token = await AuthController().getAccessToken(); // 🔐 Get token

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token", // ✅ Include token
      },
      body: jsonEncode(model.toJson()),
    );

    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.back(); // Close dialog
      Get.snackbar("Success", "Project created successfully");
    } else {
      Get.snackbar("Error", "Failed to create project");
    }
  } catch (e) {
    Get.snackbar("Error", "Something went wrong: $e");
  }
}
