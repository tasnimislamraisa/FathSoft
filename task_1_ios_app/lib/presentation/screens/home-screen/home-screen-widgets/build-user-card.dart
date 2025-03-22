import 'package:task_1_ios_app/my-imports.dart';

class BuildUserCard extends StatelessWidget {
  const BuildUserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: CupertinoColors.systemGrey2, blurRadius: 4)
          ],
        ),
        child: ListTile(
          title: Text("Xin chào,"),
          subtitle: Text("Võ Nguyên Minh Huy",
              style: TextStyle(fontWeight: FontWeight.bold)),
          leading: Image(image: AssetImage('assets/images/logo.png')),
        ),
      ),
    );
  }
}
