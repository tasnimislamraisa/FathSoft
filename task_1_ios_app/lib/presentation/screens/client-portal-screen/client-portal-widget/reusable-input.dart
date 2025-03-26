import 'package:task_1_ios_app/my-imports.dart';

class ReusableInput extends StatelessWidget {
  final String hint;
  final IconData? icon;
  final Function(String)? onChanged;

  const ReusableInput({
    super.key,
    required this.hint,
    this.icon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: icon != null ? Icon(icon) : null,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
