import 'package:task_1_ios_app/my-imports.dart';

Widget ActionButtons({int flex = 3}) {
  return Expanded(
    flex: flex,
    child: Row(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: EdgeInsets.zero,
            minimumSize: const Size(30, 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Icon(Icons.edit),
        ),
        const SizedBox(width: 6),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            minimumSize: const Size(30, 30),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Icon(Icons.delete),
        ),
      ],
    ),
  );
}
