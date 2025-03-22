import 'package:task_1_ios_app/my-imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Stack(
          children: [
            // Background Header
            Container(
              height: 169,
              color: AppColors.themeColor,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child:
                        Icon(CupertinoIcons.bars, color: CupertinoColors.white),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: CupertinoTextField(
                      placeholder: 'Tìm kiếm chức năng',
                      prefix: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(CupertinoIcons.search),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: CupertinoColors.systemGrey6,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Stack(
                    children: [
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Icon(CupertinoIcons.bell,
                            color: CupertinoColors.white),
                        onPressed: () {},
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: CupertinoColors.destructiveRed,
                          child: Text(
                            '1',
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: CupertinoColors.white,
                    child: Icon(Icons.person_4_outlined,
                        color: AppColors.themeColor),
                  ),
                ],
              ),
            ),

            // Content below header with user card
            Column(
              children: [
                SizedBox(
                    height:
                        100), // Push down the user card slightly overlapping
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: BuildUserCard(),
                ),
                SizedBox(height: 12),
                Expanded(child: BuildGridMenu()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
