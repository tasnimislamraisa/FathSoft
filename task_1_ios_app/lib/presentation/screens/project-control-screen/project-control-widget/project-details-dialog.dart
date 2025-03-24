import 'package:task_1_ios_app/my-imports.dart';

class ProjectDetailsDialog extends StatelessWidget {
  final Map<String, String> project;

  const ProjectDetailsDialog({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title & Close
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Project Details",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.close),
                )
              ],
            ),
            const Divider(),
            _detailRow("Project Name", project['name']!),
            const Divider(),
            _detailRow("Project Code", project['code']!),
            const Divider(),
            _detailRow("Location", project['location']!),
            const Divider(),
            _detailRow("Contact Number", "(480) 555-0103"),
            const Divider(),
            _detailRow("Stage", project['stage']!),
            const Divider(),
            _detailRow("Start Date", "2024-11-29"),
            const Divider(),
            _detailRow("Hand Over Date", "2024-11-29"),
            const Divider(),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(child: Text("$title:")),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
