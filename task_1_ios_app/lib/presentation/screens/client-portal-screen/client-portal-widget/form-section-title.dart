import 'package:task_1_ios_app/my-imports.dart';

class FormSectionTitle extends StatelessWidget {
  final String title;
  const FormSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }
}
