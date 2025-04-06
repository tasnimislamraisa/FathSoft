import 'package:task_1_ios_app/my-imports.dart';
import 'package:task_1_ios_app/presentation/controller/create-project-controller.dart';

class AddProjectDialog extends StatefulWidget {
  const AddProjectDialog({super.key});

  @override
  State<AddProjectDialog> createState() => _AddProjectDialogState();
}

class _AddProjectDialogState extends State<AddProjectDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _projectName = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _contact = TextEditingController();
  final TextEditingController _startDate = TextEditingController();
  final TextEditingController _handoverDate = TextEditingController();
  final TextEditingController _projectCode = TextEditingController(
      text: "PRJ-${DateTime.now().millisecondsSinceEpoch}");
  String? _stage, _projectType, _status;

  final List<String> _stages = ['1', '2', '3'];
  final List<String> _types = ['0', '1'];
  final List<String> _statuses = ['0', '1'];

  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _dialogHeader(),
            const Divider(height: 1),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _fieldLabel("Project Name:"),
                      _textField(_projectName, "Enter project name"),
                      _fieldLabel("Location:"),
                      _textField(_location, "Enter location"),
                      _fieldLabel("Contact Number:"),
                      _textField(_contact, "Enter contact", isNumber: true),
                      _fieldLabel("Project Start Date:"),
                      _dateField(_startDate),
                      _fieldLabel("Approx. Hand Over Date:"),
                      _dateField(_handoverDate),
                      _fieldLabel("Project Code:"),
                      _textField(_projectCode, "", readOnly: true),
                      _fieldLabel("Project Type:"),
                      _dropdownField(_types, _projectType,
                          (val) => setState(() => _projectType = val)),
                      _fieldLabel("Stage:"),
                      _dropdownField(_stages, _stage,
                          (val) => setState(() => _stage = val)),
                      _fieldLabel("Status:"),
                      _dropdownField(_statuses, _status,
                          (val) => setState(() => _status = val)),
                      const SizedBox(height: 20),
                      AddButton(
                        title: "Add",
                        onTap: () async {
                          final Map<String, dynamic> projectData = {
                            "project_name": "Amazon233333",
                            "location": "dhaka",
                            "contact_number": "01800000000",
                            "project_start_date": "2025-12-01",
                            "approx_handover_date": "2026-12-01",
                            "project_code":
                                "PRJ-${DateTime.now().millisecondsSinceEpoch}",
                            "stage": "1",
                            "project_type": "0",
                            "status": "1",
                            "logo": "placeholder_logo", // Must not be null
                            "architect_drawing_file":
                                "placeholder_file", // Must not be null
                          };

                          await createProject(projectData);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dialogHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Add Project",
              style: TextStyle(fontWeight: FontWeight.bold)),
          IconButton(icon: const Icon(Icons.close), onPressed: () => Get.back())
        ],
      ),
    );
  }

  Widget _fieldLabel(String text) => Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 4),
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
      );

  Widget _textField(TextEditingController controller, String hint,
      {bool readOnly = false, bool isNumber = false}) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      keyboardType: isNumber ? TextInputType.phone : TextInputType.text,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
      validator: (value) =>
          (value == null || value.trim().isEmpty) ? 'Required' : null,
    );
  }

  Widget _dateField(TextEditingController controller) {
    return GestureDetector(
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          firstDate: DateTime(2020),
          lastDate: DateTime(2100),
          initialDate: DateTime.now(),
        );
        if (picked != null) {
          controller.text = picked.toIso8601String().split("T").first;
        }
      },
      child: AbsorbPointer(
        child: _textField(controller, "Select date", readOnly: true),
      ),
    );
  }

  Widget _dropdownField(
      List<String> options, String? value, ValueChanged<String?> onChanged) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      validator: (val) => val == null ? 'Please select' : null,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
      items: options
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
    );
  }
}
