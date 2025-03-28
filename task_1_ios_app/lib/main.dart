import 'package:task_1_ios_app/my-imports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'IOS App',
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinder(),
      home: const LogInScreen(),
      //home: const DashboardScreen(),

      // Localization support
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // Add more locales here if needed
      ],
    );
  }
}
