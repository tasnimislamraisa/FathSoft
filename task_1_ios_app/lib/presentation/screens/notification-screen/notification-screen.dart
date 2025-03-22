import 'package:task_1_ios_app/my-imports.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification Screen"),
      ),
      body: Center(
          child: Container(
        child: Text("Welcome To The App"),
      )),
    );
  }
}
