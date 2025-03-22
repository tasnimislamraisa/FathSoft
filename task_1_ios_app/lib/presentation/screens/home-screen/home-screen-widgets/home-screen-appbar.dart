import 'package:task_1_ios_app/my-imports.dart';

class _buildAppBar extends StatelessWidget {
  const _buildAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextField(
        decoration: InputDecoration(
          hintText: 'Tìm kiếm chức năng',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {},
        ),
        CircleAvatar(
          backgroundImage: AssetImage('assets/user.jpg'),
        ),
      ],
    );
  }
}
