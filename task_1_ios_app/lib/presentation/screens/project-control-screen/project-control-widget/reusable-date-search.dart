import 'package:intl/intl.dart';
import 'package:task_1_ios_app/my-imports.dart';

class ReusableDateSearch extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const ReusableDateSearch({
    super.key,
    required this.label,
    required this.controller,
    this.initialDate,
    this.firstDate,
    this.lastDate,
  });

  @override
  State<ReusableDateSearch> createState() => _ReusableDateSearchState();
}

class _ReusableDateSearchState extends State<ReusableDateSearch> {
  Future<void> _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: widget.initialDate ?? DateTime.now(),
      firstDate: widget.firstDate ?? DateTime(2000),
      lastDate: widget.lastDate ?? DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      widget.controller.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label(widget.label),
        TextField(
          readOnly: true,
          controller: widget.controller,
          onTap: _pickDate,
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.calendar_today_outlined),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            filled: true,
            fillColor: Colors.grey.shade100,
          ),
        ),
      ],
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
}
