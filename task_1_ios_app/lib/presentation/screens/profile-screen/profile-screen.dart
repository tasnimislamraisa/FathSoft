import 'package:task_1_ios_app/my-imports.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Screen"),
      ),
      body: Center(
          child: Container(
        child: Text("Welcome To The App"),
      )),
    );
  }
}
