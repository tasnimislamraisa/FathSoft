import 'package:task_1_ios_app/my-imports.dart';

Widget ActionButtons({
  int flex = 3,
  Map<String, String>? project,
  required NetworkCaller networkCaller,
  required AuthController authController,
}) {
  return Expanded(
    flex: flex,
    child: Row(
      children: [
        // Edit Button
        ElevatedButton(
          onPressed: () async {
            final updateBody = {
              "company_id": "1",
              "project_name": project?['name'] ?? 'Amazon2333332',
              "location": project?['location'] ?? 'dhaka',
              "contact_number": "123456789",
              "project_start_date": "2025-01-01",
              "approx_handover_date": "2025-12-01",
              "project_code": project?['code'] ?? '1',
              "stage": "1",
              "project_type": "0",
              "status": "1",
              "logo": "logo.png",
              "architect_drawing_file": "drawing.pdf"
            };

            final response = await networkCaller.putRequest(
              url: Urls.updateProject(int.parse(project?['id'] ?? '0')),
              token: await authController.getAccessToken(),
              body: updateBody,
            );

            if (response.isSuccess) {
              Get.snackbar("Success", "Project updated successfully",
                  backgroundColor: Colors.green, colorText: Colors.white);
            } else {
              Get.snackbar("Error", "Failed to update project",
                  backgroundColor: Colors.red, colorText: Colors.white);
            }
          },
          child: const Icon(Icons.edit),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: EdgeInsets.zero,
            minimumSize: const Size(30, 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(width: 6),
        ElevatedButton(
          onPressed: () async {
            final response = await networkCaller.deleteRequest(
              url: Urls.DeleteProject(int.parse(project?['id'] ?? '0')),
              token: await authController.getAccessToken(),
            );

            if (response.isSuccess) {
              Get.snackbar("Success", "Project deleted successfully",
                  backgroundColor: Colors.green, colorText: Colors.white);
            } else {
              Get.snackbar("Error", "Failed to delete project",
                  backgroundColor: Colors.red, colorText: Colors.white);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            minimumSize: const Size(30, 30),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Icon(Icons.delete),
        ),
      ],
    ),
  );
}
