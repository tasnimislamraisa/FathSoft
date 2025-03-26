import 'package:task_1_ios_app/my-imports.dart';

class BuildProfileMenu extends StatefulWidget {
  const BuildProfileMenu({super.key});

  @override
  State<BuildProfileMenu> createState() => _BuildProfileMenuState();
}

class _BuildProfileMenuState extends State<BuildProfileMenu> {
  Future<Map<String, String>> _getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('user-name') ?? 'No Name';
    final email = prefs.getString('user-email') ?? 'No Email';
    return {'name': name, 'email': email};
  }

  void _logoutUser(BuildContext context) async {
    await AuthController().clearUserData();
    Get.offAll(() => const LogInScreen());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String>>(
      future: _getUserInfo(),
      builder: (context, snapshot) {
        final userName = snapshot.data?['name'] ?? 'Loading...';
        final userEmail = snapshot.data?['email'] ?? '';

        return PopupMenuButton<int>(
          icon: const CircleAvatar(child: Text('SC')),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 0,
              child: ListTile(
                title: Text(userName),
                subtitle: Text(userEmail),
              ),
            ),
            const PopupMenuDivider(),
            const PopupMenuItem(
              value: 1,
              child: ListTile(
                  leading: Icon(Icons.person_outline), title: Text('Profile')),
            ),
            const PopupMenuItem(
              value: 2,
              child: ListTile(
                  leading: Icon(Icons.credit_card_outlined),
                  title: Text('Billing')),
            ),
            const PopupMenuItem(
              value: 3,
              child: ListTile(
                  leading: Icon(Icons.settings_outlined),
                  title: Text('Settings')),
            ),
            const PopupMenuDivider(),
            PopupMenuItem(
              value: 4,
              child: Builder(
                builder: (context) => ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Log out'),
                  onTap: () => _logoutUser(context),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
