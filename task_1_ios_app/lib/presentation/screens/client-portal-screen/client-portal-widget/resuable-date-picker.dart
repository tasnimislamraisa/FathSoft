import 'package:intl/intl.dart';
import 'package:task_1_ios_app/my-imports.dart';

class ReusableDatePicker extends StatefulWidget {
  final String label;

  const ReusableDatePicker({super.key, required this.label});

  @override
  State<ReusableDatePicker> createState() => _ReusableDatePickerState();
}

class _ReusableDatePickerState extends State<ReusableDatePicker> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        TextField(
          readOnly: true,
          controller: TextEditingController(
              text: selectedDate != null
                  ? DateFormat('dd-MM-yyyy').format(selectedDate!)
                  : ""),
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.calendar_today),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            filled: true,
            fillColor: Colors.grey.shade100,
          ),
          onTap: () async {
            DateTime? date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1950),
              lastDate: DateTime(2100),
            );
            if (date != null) setState(() => selectedDate = date);
          },
        ),
      ],
    );
  }
}
