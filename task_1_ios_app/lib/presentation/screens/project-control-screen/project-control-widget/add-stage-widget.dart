import 'package:intl/intl.dart';
import 'package:task_1_ios_app/my-imports.dart';

class AddStageDialog extends StatefulWidget {
  const AddStageDialog({super.key});

  @override
  State<AddStageDialog> createState() => _AddStageDialogState();
}

class _AddStageDialogState extends State<AddStageDialog> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _stageController = TextEditingController();

  Future<void> _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        _dateController.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Add Stage",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Get.back(),
                )
              ],
            ),
            const SizedBox(height: 12),

            // Date Field
            ReusableDateSearch(
              label: "Date",
              controller: _dateController,
            ),

            // Stage Name Field
            _label("Stage Name"),
            _stageField(),

            const SizedBox(height: 20),

            // Save Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // You can fetch values like:
                  // print(_dateController.text);
                  // print(_stageController.text);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child:
                    const Text("Save", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 6),
      child: Text(
        '* $text',
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _dateField() {
    return TextField(
      readOnly: true,
      controller: _dateController,
      onTap: _pickDate,
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.calendar_today_outlined),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
    );
  }

  Widget _stageField() {
    return TextField(
      controller: _stageController,
      decoration: InputDecoration(
        hintText: "Enter stage name",
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
    );
  }
}
