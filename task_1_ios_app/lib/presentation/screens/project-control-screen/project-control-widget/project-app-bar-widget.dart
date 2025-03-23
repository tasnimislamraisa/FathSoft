import 'package:task_1_ios_app/my-imports.dart';

class CustomProjectAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const CustomProjectAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      centerTitle: true,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.wb_sunny_outlined),
        ),
        BuildProfileMenu(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
