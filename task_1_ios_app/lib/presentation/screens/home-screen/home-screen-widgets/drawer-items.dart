import 'package:task_1_ios_app/my-imports.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String selectedItem;
  final VoidCallback onTap;
  final bool hasArrow;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.label,
    required this.selectedItem,
    required this.onTap,
    this.hasArrow = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedItem == label;

    return Container(
      color: isSelected ? Colors.blue.shade50 : Colors.transparent,
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected ? Colors.blue : Colors.black87,
        ),
        title: Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.blue : Colors.black87,
          ),
        ),
        trailing:
            hasArrow ? Icon(Icons.chevron_right, color: Colors.black45) : null,
        onTap: onTap,
      ),
    );
  }
}
