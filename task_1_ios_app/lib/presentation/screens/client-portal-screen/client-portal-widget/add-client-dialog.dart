import 'package:task_1_ios_app/my-imports.dart';

class AddClientDialog extends StatefulWidget {
  const AddClientDialog({super.key});

  @override
  State<AddClientDialog> createState() => _AddClientDialogState();
}

class _AddClientDialogState extends State<AddClientDialog> {
  String? selectedProject;
  String? selectedBuilding;
  String? selectedStatus;

  final List<String> projectList = ['Unique IT Center', 'Shopnonogor R/A'];
  final List<String> buildingList = ['UT-1', 'UT-2'];
  final List<String> statusList = ['Existing', 'New'];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title & Close
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Add Client',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Select Project
            _buildDropdownLabel("* Select Project:"),
            _buildDropdownField(
              value: selectedProject,
              hint: "Select Project",
              items: projectList,
              onChanged: (value) => setState(() => selectedProject = value),
            ),

            // Select Building / Site
            _buildDropdownLabel("* Select Building / Site:"),
            _buildDropdownField(
              value: selectedBuilding,
              hint: "Select Building",
              items: buildingList,
              onChanged: (value) => setState(() => selectedBuilding = value),
            ),

            // Select Status
            _buildDropdownLabel("Select Client Status"),
            _buildDropdownField(
              value: selectedStatus,
              hint: "Select status",
              items: statusList,
              onChanged: (value) => setState(() => selectedStatus = value),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, top: 12),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: text.startsWith("*") ? Colors.red.shade700 : Colors.black,
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    String? value,
    required String hint,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      hint: Text(hint),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      items: items
          .map((item) => DropdownMenuItem(value: item, child: Text(item)))
          .toList(),
      onChanged: onChanged,
    );
  }
}
