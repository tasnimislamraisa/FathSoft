import 'package:task_1_ios_app/my-imports.dart';

ViewSiteButton({required String projectName}) {
  return Expanded(
    flex: 2,
    child: ElevatedButton(
      onPressed: () {
        Get.dialog(SiteViewDialog(projectName: projectName));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        minimumSize: const Size(double.infinity, 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: const Text("View", style: TextStyle(color: Colors.white)),
    ),
  );
}
