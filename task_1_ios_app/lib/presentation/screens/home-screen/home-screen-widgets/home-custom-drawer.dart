import 'package:task_1_ios_app/my-imports.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: CupertinoColors.activeBlue),
            child: Text("Menu",
                style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.home),
            title: Text("Trang chủ"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(CupertinoIcons.settings),
            title: Text("Cài đặt"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
