import 'package:task_1_ios_app/my-imports.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Screen"),
      ),
      body: Center(
          child: Container(
        child: Text("Welcome To The App"),
      )),
    );
  }
}
