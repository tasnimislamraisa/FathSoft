import 'package:task_1_ios_app/controller_binder.dart';
import 'package:task_1_ios_app/my-imports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'IOS App',
      initialBinding: ControllerBinder(),
      home: const LogInScreen(),
    );
  }
}
