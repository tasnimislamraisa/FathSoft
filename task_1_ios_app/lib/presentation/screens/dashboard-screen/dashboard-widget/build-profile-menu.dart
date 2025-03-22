import "package:task_1_ios_app/my-imports.dart";

Widget BuildProfileMenu() {
  return PopupMenuButton<int>(
    icon: const CircleAvatar(child: Text('SC')),
    itemBuilder: (context) => [
      const PopupMenuItem(
        value: 0,
        child: ListTile(
          title: Text('John Doe'),
          subtitle: Text('john.doe@example.com'),
        ),
      ),
      const PopupMenuDivider(),
      const PopupMenuItem(
          value: 1,
          child: ListTile(
              leading: Icon(Icons.person_outline), title: Text('Profile'))),
      const PopupMenuItem(
          value: 2,
          child: ListTile(
              leading: Icon(Icons.credit_card_outlined),
              title: Text('Billing'))),
      const PopupMenuItem(
          value: 3,
          child: ListTile(
              leading: Icon(Icons.settings_outlined), title: Text('Settings'))),
      const PopupMenuDivider(),
      const PopupMenuItem(
          value: 4,
          child: ListTile(leading: Icon(Icons.logout), title: Text('Log out'))),
    ],
    onSelected: (value) {
      // Handle selection
    },
  );
}
